namespace TraduSquare.Web.WordpressMigrator.Wrx;

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Xml;

internal class WrxTraduSquareProjectParser
{
    private static readonly IFormatProvider DateCulture = new CultureInfo("en-US");
    private const string PostDateFormat = "yyyy-MM-dd HH:mm:ss";
    private const string EmptyDate = "0000-00-00 00:00:00";
    private readonly string xmlPath;

    public WrxTraduSquareProjectParser(string xmlPath)
    {
        if (!File.Exists(xmlPath)) {
            throw new FileNotFoundException("Invalid XML path", xmlPath);
        }

        this.xmlPath = xmlPath;
    }

    public IEnumerable<TraduSquareProjectInfo> GetProjects()
    {
        using XmlReader reader = XmlReader.Create(xmlPath);

        if (!reader.ReadToFollowing("rss")) {
            throw new FormatException("Expected root element rss");
        }

        if (!reader.ReadToDescendant("channel")) {
            throw new FormatException("Expected element channel");
        }

        while (reader.ReadToFollowing("item")) {
            if (TryReadProjectInfo(reader, out TraduSquareProjectInfo projectInfo)) {
                yield return projectInfo;
            }
        }
    }

    private bool TryReadProjectInfo(XmlReader reader, out TraduSquareProjectInfo project)
    {
        reader.Read();
        project = new TraduSquareProjectInfo();

        while (reader.NodeType != XmlNodeType.EndElement && !reader.EOF) {
            reader.MoveToContent();
            if (reader.NodeType == XmlNodeType.EndElement) {
                break;
            }

            switch (reader.Name) {
                case "title":
                    project.Title = reader.ReadElementContentAsString();
                    break;

                case "link":
                    project.Link = reader.ReadElementContentAsString();
                    break;

                case "pubDate":
                    string pubDate = reader.ReadElementContentAsString();
                    pubDate = pubDate.Replace("+0000", "GMT"); // to follow RFC-1123
                    if (!string.IsNullOrWhiteSpace(pubDate)) {
                        project.PublicationDate = DateTimeOffset.ParseExact(pubDate, "R", DateCulture);
                    }
                    break;

                case "dc:creator":
                    project.Creator = reader.ReadElementContentAsString();
                    break;

                case "wp:post_id":
                    project.Id = reader.ReadElementContentAsInt();
                    break;

                case "wp:post_date_gmt":
                    string postDate = reader.ReadElementContentAsString();
                    if (!string.IsNullOrEmpty(postDate) && postDate != EmptyDate) {
                        project.PostDate = DateTimeOffset.ParseExact(postDate, PostDateFormat, DateCulture, DateTimeStyles.AssumeUniversal);
                    }
                    break;

                case "wp:post_modified_gmt":
                    string modifiedDate = reader.ReadElementContentAsString();
                    if (!string.IsNullOrEmpty(modifiedDate) && modifiedDate != EmptyDate) {
                        project.LastModifiedDate = DateTimeOffset.ParseExact(modifiedDate, PostDateFormat, DateCulture, DateTimeStyles.AssumeUniversal);
                    }
                    break;

                case "wp:post_type":
                    string type = reader.ReadElementContentAsString();
                    if (type != "proyectos") {
                        while (reader.NodeType != XmlNodeType.EndElement) {
                            reader.Skip();
                        }
                        reader.Read(); // read end element
                        return false;
                    }
                    break;

                case "wp:post_name":
                    project.Slug = reader.ReadElementContentAsString();
                    break;

                case "wp:status":
                    project.PostStatus = reader.ReadElementContentAsString();
                    break;

                case "wp:postmeta":
                    (string metadataKey, string metadataValue) = ReadPostMetadata(reader);
                    switch (metadataKey) {
                        case "informacion-de-la-ficha":
                            project.CardInfo = metadataValue;
                            break;
                        case "informacion-adicional":
                            project.AdditionalInfo = metadataValue;
                            break;
                        case "equipo":
                            project.Team = metadataValue;
                            break;
                        case "sinopsis":
                            project.Synopsis = metadataValue;
                            break;
                        case "capturas-de-pantalla":
                            string[] screenshots = metadataValue.Split(',');
                            project.Screenshots.AddRange(screenshots);
                            break;
                        case "porcentajes":
                            // TODO: parse structure
                            break;
                        case "enlaces-de-compra":
                            project.BuyInfo = metadataValue;
                            break;
                        case "enlaces-del-parche":
                            project.PatchDownloadInfo = metadataValue;
                            break;
                        case "estado-del-proyecto":
                            project.ProjectStatus = metadataValue;
                            break;
                        case "idioma":
                            // TODO: parse structure
                            break;
                        case "plataforma":
                            // TODO: parse structure
                            break;
                        case "plataformas":
                            // TODO: parse structure
                            break;
                        case "_yoast_wpseo_metadesc":
                            project.SeoSummary = metadataValue;
                            break;
                    }
                    break;

                default:
                    reader.Skip();
                    break;
            }
        }

        reader.Read();
        return true;
    }

    private (string key, string value) ReadPostMetadata(XmlReader reader)
    {
        string key = string.Empty;
        string value = string.Empty;

        reader.Read();
        while (reader.NodeType != XmlNodeType.EndElement && !reader.EOF) {
            reader.MoveToContent();
            if (reader.Name == "wp:meta_key") {
                key = reader.ReadElementContentAsString();
            } else if (reader.Name == "wp:meta_value") {
                value = reader.ReadElementContentAsString();
            }
        }

        reader.Read(); // end element
        return (key, value);
    }
}

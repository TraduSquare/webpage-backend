namespace TraduSquare.Web.Rest.Projects;

using System.Collections.ObjectModel;

public class IndexProjectResponse : Collection<IndexProjectInfo>
{
}

public record IndexProjectInfo
{
    public int Id { get; set; } = -1;
    public string Title { get; set; } = string.Empty;
    public string Slug { get; set; } = string.Empty;
    public string? TechnicalInfo { get; set; }
    public string? Description { get; set; }
    public string? Team { get; set; }
    public string? Download { get; set; }
    public string? AdditionalInfo { get; set; }
    public string? BuyLink { get; set; }
    public string? CreatedAt { get; set; }
    public string? UpdatedAt { get; set; }
    public string Uuid { get; set; } = string.Empty;
}

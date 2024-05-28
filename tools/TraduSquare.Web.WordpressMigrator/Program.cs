using System.Diagnostics;
using TraduSquare.Web.Rest.Client;
using TraduSquare.Web.Rest.Projects;
using TraduSquare.Web.WordpressMigrator.Wrx;

if (args.Length != 1 || !File.Exists(args[0])) {
    Console.Error.WriteLine("Missing argument or file does not exist");
    Console.Error.WriteLine("USAGE: WordpressMigrator.exe <WRX_PATH>");
    Environment.Exit(1);
}

string wordpressXmlPath = args[0];

string? token = Environment.GetEnvironmentVariable("TS_CLIENT_TOKEN");
if (string.IsNullOrEmpty(token)) {
    Console.Error.WriteLine("Missing token for the backend client.");
    Console.Error.WriteLine("Ensure the environment variable TS_CLIENT_TOKEN is set");
    Environment.Exit(2);
}

var client = new TraduSquareRestClient("http://localhost:2300", token);
var parser = new WrxTraduSquareProjectParser(wordpressXmlPath);

Stopwatch timer = Stopwatch.StartNew();
foreach (var info in parser.GetProjects()) {
    if (info.PostStatus == "draft") {
        Console.WriteLine("- Skipping draft for '{0}'", info.Title);
        continue;
    }

    if (string.IsNullOrEmpty(info.Slug) || string.IsNullOrEmpty(info.Title)) {
        Console.WriteLine("- Missing title and/or slug for: {0}", info);
        continue;
    }

    Console.WriteLine("- Creating project: '{0}'", info.Title);
    var projectRequest = new CreateProjectRequest {
        Project = new CreateProjectInfo {
            Title = info.Title,
            Slug = info.Slug,
            AdditionalInfo = info.AdditionalInfo,
            BuyLink = info.BuyInfo,
            Description = info.Synopsis,
            Download = info.PatchDownloadInfo,
            Team = info.Team,
            TechnicalInfo = info.CardInfo,
        },
    };

    try {
        await client.Projects.CreateAsync(projectRequest);
    } catch (Exception ex) {
        Console.WriteLine("  - Failed to create {0} with error {1}", info.Title, ex.Message);
    }
}

timer.Stop();
Console.WriteLine("Done! {0}", timer.Elapsed);

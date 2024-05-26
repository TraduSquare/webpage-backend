namespace TraduSquare.Web.Rest.Projects;

public class CreateProjectRequest
{
    public required CreateProjectInfo Project { get; init; }
}

public class CreateProjectInfo
{
    public required string Title { get; set; }

    public required string Slug { get; set; }

    public string? TechnicalInfo { get; set; }

    public string? Description { get; set; }

    public string? Team { get; set; }

    public string? Download { get; set; }

    public string? AdditionalInfo { get; set; }

    public string? BuyLink { get; set; }
}

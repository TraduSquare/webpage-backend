namespace TraduSquare.Web.Rest.Projects;

public class CreateProjectRequest
{
    public required CreateProjectInfo Project { get; init; }
}

public class CreateProjectInfo
{
    public required string Title { get; set; }

    public required string Slug { get; set; }

    public required string Description { get; set; }
}

using TraduSquare.Web.Rest.Client;
using TraduSquare.Web.Rest.Projects;

Console.WriteLine("Hello");

const string Token = "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJUcmFkdVNxdWFyZSIsImlhdCI6MTcxNjU4NjU3MiwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoiam9ndWVyc2FuQGdtYWlsLmNvbSIsIkdpdmVuTmFtZSI6IkpvcmdlIiwiU3VybmFtZSI6Ikd1ZXJyYSIsIkVtYWlsIjoiam9ndWVyc2FuQGdtYWlsLmNvbSIsIlJvbGVzIjpbIlJlYWQiLCJXcml0ZSJdfQ.qjZDtWWlNBKVtTcHI4gsqdeTlgyYsV1MXZsVOiwH5sU";
var client = new TraduSquareRestClient("http://localhost:2300", Token);

var projectInfo = new CreateProjectRequest {
    Project = new CreateProjectInfo {
        Title = "Pokémon Conqueset",
        Slug = "pokemon-conquest",
        Description = "Cool game",
    },
};
CreateProjectResponse? response = await client.Projects.CreateAsync(projectInfo);
Console.WriteLine(response);

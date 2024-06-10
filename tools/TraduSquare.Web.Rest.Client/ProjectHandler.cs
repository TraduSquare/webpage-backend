namespace TraduSquare.Web.Rest.Client;

using System;
using System.Text.Json;
using System.Threading.Tasks;
using RestSharp;
using TraduSquare.Web.Rest.Projects;

public class ProjectHandler
{
    private readonly RestClient client;

    internal ProjectHandler(RestClient client)
    {
        this.client = client ?? throw new ArgumentNullException(nameof(client));
    }

    public async Task<CreateProjectResponse> CreateAsync(CreateProjectRequest project)
    {
        // The backend doesn't like empty values
        if (string.IsNullOrEmpty(project.Project.TechnicalInfo)) {
            project.Project.TechnicalInfo = null;
        }
        if (string.IsNullOrEmpty(project.Project.Team)) {
            project.Project.Team = null;
        }
        if (string.IsNullOrEmpty(project.Project.Description)) {
            project.Project.Description = null;
        }
        if (string.IsNullOrEmpty(project.Project.AdditionalInfo)) {
            project.Project.AdditionalInfo = null;
        }
        if (string.IsNullOrEmpty(project.Project.BuyLink)) {
            project.Project.BuyLink = null;
        }
        if (string.IsNullOrEmpty(project.Project.Download)) {
            project.Project.Download = null;
        }

        var request = new RestRequest("/projects", Method.Post)
            .AddJsonBody(project)
            .AddOrUpdateHeader("content-type", "application/json");
        return await client.PostAsync<CreateProjectResponse?>(request)
            ?? throw new InvalidOperationException("Invalid server response");
        
    }

    public async Task<IndexProjectResponse> GetAll()
    {
        var request = new RestRequest("/projects", Method.Get);
        return await client.GetAsync<IndexProjectResponse?>(request)
            ?? throw new InvalidOperationException("Invalid server response");
    }

    public async Task<GetProjectResponse> Get(string projectUrl)
    {
        var request = new RestRequest("/projects/" + projectUrl, Method.Get);
        return await client.GetAsync<GetProjectResponse?>(request)
            ?? throw new InvalidOperationException("Invalid server response");
    }

#if false
    private async Task<T?> ExecuteVerbose<T>(string resource, Method method)
    {
        var request = new RestRequest(resource, method);
        var response = await client.ExecuteAsync(request).ConfigureAwait(false);

        var statusCode = response.StatusCode;
        string content = response.Content;

        response.ThrowIfError();
        T? output = JsonSerializer.Deserialize<T>(response.Content ?? "{}");
        return output;
    }
#endif
}

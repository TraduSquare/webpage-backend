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

    public async Task<CreateProjectResponse?> CreateAsync(CreateProjectRequest project)
    {
        var request = new RestRequest("/projects", Method.Post)
            .AddJsonBody(project)
            .AddOrUpdateHeader("content-type", "application/json");
        return await client.PostAsync<CreateProjectResponse?>(request);
        
    }

    public async Task<IEnumerable<CreateProjectResponse>> GetAll()
    {
        throw new NotImplementedException();
    }

    public async Task<CreateProjectResponse?> Get(string projectUrl)
    {
        throw new NotImplementedException();
    }

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
}

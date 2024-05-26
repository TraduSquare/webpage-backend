namespace TraduSquare.Web.Rest.Client;

using System.Text.Json;
using RestSharp;
using RestSharp.Serializers.Json;

public class TraduSquareRestClient
{
    public TraduSquareRestClient(string baseUrl, string token)
    {
        var options = new RestClientOptions(baseUrl);

        var jsonOptions = new JsonSerializerOptions {
            PropertyNamingPolicy = JsonNamingPolicy.SnakeCaseLower,
        };
        var client = new RestClient(
            options,
            configureSerialization: s => s.UseSystemTextJson(jsonOptions));

        // TEMP: workaround until the API supports login
        client.AddDefaultHeader("Authorization", token);

        Projects = new ProjectHandler(client);
    }

    public ProjectHandler Projects { get; }
}

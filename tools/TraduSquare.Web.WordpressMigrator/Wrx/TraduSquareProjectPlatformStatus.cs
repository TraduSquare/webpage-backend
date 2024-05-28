namespace TraduSquare.Web.WordpressMigrator.Wrx;

internal record TraduSquareProjectPlatformStatus
{
    public required string Platform { get; init; }

    public required string Status { get; init; }
}

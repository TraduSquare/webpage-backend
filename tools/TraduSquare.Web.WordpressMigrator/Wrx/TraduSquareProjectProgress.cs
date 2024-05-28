namespace TraduSquare.Web.WordpressMigrator.Wrx;

internal record TraduSquareProjectProgress
{
    public required string Name { get; init; }

    public required int Percentage { get; init; }
}

namespace TraduSquare.Web.WordpressMigrator.Wrx;

using System;
using System.Collections.ObjectModel;

internal record TraduSquareProjectInfo
{
    public string? Title { get; internal set; }

    public string? Link { get; internal set; }

    public string? Slug { get; internal set; }

    public DateTimeOffset PublicationDate { get; internal set; }

    public string? Creator { get; internal set; }

    public int Id { get; internal set; }

    public DateTimeOffset PostDate { get; internal set; }

    public DateTimeOffset LastModifiedDate { get; internal set; }

    public string? PostStatus { get; internal set; }

    public string? CardInfo { get; internal set; }

    public string? AdditionalInfo { get; internal set; }

    public string? Team { get; internal set; }

    public string? Synopsis { get; internal set; }

    public Collection<string> Screenshots { get; init; } = [];

    public Collection<TraduSquareProjectProgress> Progress { get; init; } = [];

    public string? BuyInfo { get; internal set; }

    public string? PatchDownloadInfo { get; internal set; }

    public string? ProjectStatus { get; internal set; }

    public Collection<TraduSquareProjectPlatformStatus> ProjectStatusPerPlatform { get; init; } = [];

    public string? TargetPlatforms { get; internal set; }

    public Collection<string> TargetLanguages { get; init; } = [];

    public string? SeoSummary { get; internal set; }
}

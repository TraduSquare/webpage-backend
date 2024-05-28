namespace TraduSquare.Web.WordpressMigrator;

using System.Collections.Generic;
using System.Collections.ObjectModel;

internal static class CollectionExtensions
{
    public static void AddRange<T>(this Collection<T> collection, IEnumerable<T> values)
    {
        foreach (T value in values) {
            collection.Add(value);
        }
    }
}

namespace redis.Keys;

public class CacheKey
{
    public string intern { get; set; }
    public string redis { get; set; }
    public string vbt { get; set; }

    public CacheKey()
    {
        intern = "intern";
        redis = "redis";
        vbt = "vbt";
    }
}

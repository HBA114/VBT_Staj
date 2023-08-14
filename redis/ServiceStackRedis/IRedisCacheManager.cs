namespace redis.ServiceStackRedis;

public interface IRedisCacheManager
{
    void Set(string key, string value);
    void Set(string key, object value, DateTime time);
    void Delete(string key, string value, DateTime time);
    string Get(string key);
    bool Remove(string key);
    bool RemoveByPattern(string key);
}

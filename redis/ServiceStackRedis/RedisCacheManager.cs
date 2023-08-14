using Newtonsoft.Json;

using ServiceStack.Redis;

namespace redis.ServiceStackRedis;

public class RedisCacheManager : IRedisCacheManager
{
    RedisEndpoint _redisEndpoint;

    public RedisCacheManager(RedisEndpoint redisEndpoint)
    {
        _redisEndpoint = redisEndpoint;
    }

    public void Delete(string key, string value, DateTime time)
    {
        using var client = new RedisClient(_redisEndpoint);
        client.Delete<string>(key);
    }

    public string Get(string key)
    {
        try
        {
            using (IRedisClient client = new RedisClient(_redisEndpoint))
            {
                return client.Get<string>(key);
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    public bool Remove(string key)
    {
        try
        {
            using (IRedisClient client = new RedisClient(_redisEndpoint))
            {
                return client.Remove(key);
            }
        }
        catch (Exception)
        {
            return false;
        }
    }

    public bool RemoveByPattern(string key)
    {
        try
        {
            using (IRedisClient client = new RedisClient(_redisEndpoint))
            {
                var keys = client.SearchKeys(key);
                client.RemoveAll(keys);
                return true;
            }
        }
        catch (Exception)
        {
            return false;
        }
    }

    public void Set(string key, object value, DateTime time)
    {
        try
        {
            using (IRedisClient client = new RedisClient(_redisEndpoint))
            {
                var dataSerializeObject = JsonConvert.SerializeObject(value, Formatting.Indented, new JsonSerializerSettings
                {
                    PreserveReferencesHandling = PreserveReferencesHandling.Objects
                });

                client.Set(key, dataSerializeObject, time);
            }
        }
        catch (Exception)
        {
            throw;
        }
    }

    public void Set(string key, string value)
    {
        try
        {
            using (IRedisClient client = new RedisClient(_redisEndpoint))
            {
                var dataSerializeObject = JsonConvert.SerializeObject(value, Formatting.Indented, new JsonSerializerSettings
                {
                    PreserveReferencesHandling = PreserveReferencesHandling.Objects
                });

                client.Set(key, dataSerializeObject);
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
}

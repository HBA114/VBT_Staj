using redis.Keys;
using redis.Model;
using redis.ServiceStackRedis;

using ServiceStack.Redis;

RedisEndpoint redisEndpoint = new();
redisEndpoint.Host = "localhost";
redisEndpoint.Port = 6379;

RedisCacheManager redisCacheManager = new RedisCacheManager(redisEndpoint);

CacheKey cacheKey = new CacheKey();

List<VbtInternModel> vbtModel = new List<VbtInternModel>()
{
    new VbtInternModel
    {
        Guid = Guid.NewGuid(),
        Name = "Hasan Basri",
        Age = 23,
        Surname = "Ayhaner"
    },
    new VbtInternModel
    {
        Guid = Guid.NewGuid(),
        Name = "kübra",
        Age = 20,
        Surname = "topalak"
    },
    new VbtInternModel
    {
        Guid = Guid.NewGuid(),
        Name = "recep",
        Age = 21,
        Surname = "topalak"
    }
};


#region first
//Tek bir data atılmak istediğimizde yapılacak

try
{
    redisCacheManager.Set(cacheKey.intern, "VBT 2023 STAJ PROGRAMI");
    Console.WriteLine("kayit islemi basarili");
}
catch (Exception ex)
{
    Console.WriteLine("islem basarisiz", ex.Message);
}

// Getting data

try
{
    var res = redisCacheManager.Get(cacheKey.intern);
    Console.WriteLine($"Res: {res}");
}
catch (Exception ex)
{
    Console.WriteLine("islem basarisiz", ex.Message);
}

//ZAMANLI OLARAK VERME
try
{
    redisCacheManager.Set(cacheKey.redis, "redis ttl test", DateTime.Now.AddMinutes(1));
    Console.WriteLine("Basarili");
}
catch (Exception ex)
{
    Console.WriteLine("basarisiz", ex.Message);
}

try
{
   var res = redisCacheManager.Get(cacheKey.redis);
   Console.WriteLine($"Res: {res}");
}
catch (Exception ex)
{
   Console.WriteLine("basarisiz" , ex.Message);
}

bool result = redisCacheManager.Remove(cacheKey.redis);
Console.WriteLine(result);

try
{
   redisCacheManager.Set($"{cacheKey.redis}: {cacheKey.vbt}", vbtModel, DateTime.Now.AddMinutes(2));
   Console.WriteLine("Basarili");
}
catch (Exception ex)
{
   Console.WriteLine("Basarissz ", ex);
}

try
{
   var res = redisCacheManager.Get(cacheKey.redis);
   Console.WriteLine("Basarili");
   Console.WriteLine($"Res: {res}");
}
catch (Exception ex)
{
   Console.WriteLine("Basarissz ", ex);
}

result = redisCacheManager.RemoveByPattern($"{cacheKey.redis}:*");
Console.WriteLine(result);

#endregion

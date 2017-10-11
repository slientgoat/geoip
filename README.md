# 公共IP库升级：
### 1、获取ip库
# 公共IP库接口：
### 1、获取ip信息
#### 基本信息
```
接口地址: /api/ip
请求方式: get
响应类型: JSON
```

#### 请求参数
|参数  | 是否必须 | 类型 | 说明|
|---|---|---|---|
|val| true| string|  ip|


#### 返回参数
|参数  | 是否必须 | 类型 | 说明|
|---|---|---|---|
|user| true| string| ip使用者|
|multiarea| true| object[]| ip定位信息，详细查看‘ip定位信息说明’|
|minip| true| bigint| 最小端ip的inet_aton值|
|maxip| true| bigint| 最小端ip的inet_aton值|
|id| true| bigint| id|
|country| true| string| 国家|
|continent| true| string| 洲，包含七大洲和 BOGONS|
|areacode| true| string| 国家编码|

#### ip定位信息说明
|参数  | 是否必须 | 类型 | 说明|
|---|---|---|---|
|w| true| string| 纬度|
|p| true| string| 省份|
|j| true| string| 经度|
|d| true| string| 区县|
|c| true| string| 省市|


#### 成功例子
##### request:
```
/api/ip?val=214.14.31.191

```

##### response:
```json
{
    "data":{
        "user":"",
        "multiarea":[
            {
                "w":"39.966380",
                "p":"俄亥俄",
                "j":"-83.012770",
                "d":"",
                "c":"哥伦布"
            }
        ],
        "minip":3591239936,
        "maxip":3591257087,
        "id":20968208,
        "country":"美国",
        "continent":"北美洲",
        "areacode":"US"
    }
}
```
---
#### 失败例子
##### request:
```
/api/ip?val=127.0.0.1

```

##### response:
```json
{
    "data":null
}
```

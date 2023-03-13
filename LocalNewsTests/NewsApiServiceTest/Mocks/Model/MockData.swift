import Foundation

let emptyArticles = """
{
  "status": "ok",
  "totalResults": 0,
  "articles": []
}
""".data(using: .utf8)!

let data = """
{
  "status": "ok",
  "totalResults": 1,
  "articles": [
    {
      "source": {
        "id": "google-news",
        "name": "Google News"
      },
      "author": "franceinfo",
      "title": "DIRECT. Réforme des retraites",
      "description": null,
      "url": "https://news.google.com/rss/articles/CBMixgFodHRwczovL3d3dy5mcmFuY2V0dmluZm8uZnIvZWNvbm9taWUvcmV0cmFpdGUvcmVmb3JtZS1kZXMtcmV0cmFpdGVzL2RpcmVjdC1yZWZvcm1lLWRlcy1yZXRyYWl0ZXMtbGEtY29tbWlzc2lvbi1taXh0ZS1wYXJpdGFpcmUtbi1lc3QtcGFzLWpvdWVlLWQtYXZhbmNlLXByZXZpZW50LWxlLWNoZWYtZGVzLXNlbmF0ZXVycy1scl81NzA2OTE0Lmh0bWzSAQA?oc=5",
      "urlToImage": null,
      "publishedAt": null,
      "content": null
    }
  ]
}
""".data(using: .utf8)!

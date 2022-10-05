defmodule OnBoard.ShopeeClient do
  def fetchRecommendProduct do
    # import HTTPoison
    HTTPoison.start()

    url =
      "https://shopee.vn/api/v4/recommend/recommend?bundle=shop_page_category_tab_main&item_card=2&limit=30&offset=0&section=shop_page_category_tab_main_sec&shopid=88201679&sort_type=13&tab_name=topsale"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts(body)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end

    IO.puts("hehe")
  end

  def fetchRecommendProductNew do
    url =
      "https://shopee.vn/api/v4/recommend/recommend?bundle=shop_page_category_tab_main&item_card=2&limit=30&offset=0&section=shop_page_category_tab_main_sec&shopid=88201679&sort_type=13&tab_name=topsale"

    # url = "https://shopee.vn/api/v4/recommend/recommend?bundle=shop_page_category_tab_main&item_card=2&limit=30&offset=0&section=shop_page_category_tab_main_sec&shopid=88201679&sort_type=1&tab_name=popular"
    # url = "https://shopee.vn/api/v4/recommend/recommend?bundle=shop_page_category_tab_main&item_card=2&limit=30&offset=0&section=shop_page_category_tab_main_sec&shopid=88201679&sort_type=2&tab_name=latest"
    # url = "https://shopee.vn/api/v4/recommend/recommend?bundle=shop_page_category_tab_main&catid=124475145&is_generated=false&item_card=2&limit=30&offset=0&section=shop_page_category_tab_main_sec&shopid=88201679&sort_type=1&tab_name=popular"
    {:ok, response} = Tesla.get(url)
    {:ok, json} = Jason.decode(response.body)
    list = json["data"]["sections"]
    [head | []] = list
    IO.puts(head["total"])
    data = head["data"]["item"] |> Enum.at(0)
    # https://cf.shopee.vn/file/9c8b5d48e9648c671afc19e7a14fd9a7_tn
    # https://cf.shopee.vn/file/b11665625019b94e8234a95eef962018_tn
    # https://cf.shopee.vn/file/b11665625019b94e8234a95eef962018

    {data["itemid"], data["name"], data["image"], data["price"], data["price_before_discount"]}
  end
end

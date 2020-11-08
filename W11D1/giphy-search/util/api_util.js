export const fetchSearchGiphys = (queryString) => {
    return $.ajax({
        method: "GET",
        url: `http://api.giphy.com/v1/gifs/search?q=${queryString}&api_key=O4QzeOrW00PB4IqgSZpnSvV9UnzCUkjH&limit=10`
    })
}
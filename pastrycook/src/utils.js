module.exports = {
    async get(url, token){
        const rawResponse = await fetch(url, {
            method: 'GET',
            headers: {
                'authorization': token
            }
        });
        return rawResponse.json();
    },
    async post(url, data) {
        const response = await fetch(url, {
            method: "POST",
            body: JSON.stringify(data),
            headers: {
                "Content-type": "application/json; charset=UTF-8",
              },
        });
        return response.json();
    },

    async put(url, data, token){
        const response = await fetch(url, {
            method: "PUT",
            body: data,
            headers: {
                'authorization': token
            }
        });
        return response.json();

    },

    async delete(url){
        const response = await fetch(url, {
            method: "DELETE",
        });
        return response.json();
    }
}
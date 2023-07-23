module.exports = {
    async get(url){
        const rawResponse = await fetch(url);
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

    async put(url, data){
        const response = await fetch(url, {
            method: "PUT",
            body: JSON.stringify(data),
            headers: {
                "Content-type": "application/json; charset=UTF-8",
              },
        });
        return response.json();

    },

    async delete(url){
        const response = await fetch(url, {
            method: "PUT",
        });
        return response.json();
    }
}
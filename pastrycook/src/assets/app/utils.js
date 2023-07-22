module.exports = {
    async get(url){
        const rawResponse = await fetch(url);
        return rawResponse.json();
    },
    async post(url, data) {
        const response = await fetch(url, {
            method: "POST",
            body: JSON.stringify(data),
        });
        return response.json();
    },
}
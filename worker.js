export default {
    async fetch(request, env) {
          const url = new URL(request.url);
          const targetBase = "https://giswqs-titiler-endpoint.hf.space";
          const targetUrl = targetBase + url.pathname + url.search;

      const modifiedRequest = new Request(targetUrl, {
              method: request.method,
              headers: request.headers,
              body: request.body,
              redirect: "follow",
      });

      const response = await fetch(modifiedRequest);

      const modifiedResponse = new Response(response.body, response);
          modifiedResponse.headers.set("Access-Control-Allow-Origin", "*");

      return modifiedResponse;
    },
};

export async function query(url, {extraHeaders, body, method, ...args} = {}) {
  try {
    const response = await fetch(url, {
      method: method || "GET",
      headers: {
        ...extraHeaders,
      },
      body
    });
    return {
      data: await response.json(),
      error: null,
    }
  } catch (error) {
    console.error(error);
    return {
      data: null,
      error: error,
    }
  }

}
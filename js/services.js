export async function query(url, body) {
  try {
    const response = await fetch(url, {
      method: "POST",
      body
    })
    return {
      data: response,
      error: null,
    }
  } catch (error) {
    console.error(error)
    return {
      data: null,
      error: error,
    }
  }
}
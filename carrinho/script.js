import { query } from "../js/services.js";
import { render, html } from "../js/render.js";

function isEmpty(obj) {
  return (
    obj && 
    Object.keys(obj).length === 0 &&
    Object.getPrototypeOf(obj) === Object.prototype
  );
}
function intoArray(obj) {
  return Object.keys(obj).map((id) => obj[id])
}
export async function getProducts(phpFile = './hidrateData.php' ) {
  const {id} = JSON.parse(localStorage.getItem("user"))
  let cart = await query("/carrinho/server/getCarrinho.php", {
    body: JSON.stringify({userId: id}),
    method: "POST"
    }
  );

  if (isEmpty(cart)) {
    return {
      products: [],
      cart
    };
  }

  const { data, error } = await query("/carrinho/hidrateData.php", {
    method: "GET",
  });
  const products = []
 
  const cartArray = JSON.parse(cart.data.content)
  intoArray(data).
  forEach(product => { if (cartArray[product.id] != undefined) products.push(product)})

  return {
    products: products,
    cart: cartArray,
  };
}
function renderProducts(products, cart) {
  if (products.length === 0) {
    render("cart", html`<h1>Carrinho vazio</h1>`);
    return;
  }
  const ui = products
    .map((product) => {
      return html` <div class="product">
        <img src="${product.url}" alt="${product.nome}" />
        <div class="description">
          <h2>${product.nome}</h2>
          <p>${product.descricao}</p>
          <strong>R$ ${product.valor}</strong>
        </div>
        <div>
          <strong>R$ ${cart[product.id].qtd * product.valor}</strong>
        </div>
        <div class="container-qtd">
          <button class="add-btn" onclick="addToCart(${product.id})">+</button>
          <p>${cart[product.id].qtd}</p>
          <button class="remove-btn" onclick="removeFromCart(${product.id})">-</button>
        </div>
      </div>`;
    })
    .join("");
  render("cart", ui);
}
function renderTotal(total) {
  if (total === 0) render("total", "");
  else render(
    "total",
    html`
    <div class="finish-shopping">
        <h2>
        Total: R$ ${total}
        </h2>
        <button class="btn">
          <a href="./checkout">Finalizar compra</a>
        </button>
    </div>  
    `
  );
}
async function onMount(){
  // verify if is logged
  const user = JSON.parse(localStorage.getItem("user"))
  if (!user) {
    window.location = "/login"
    return
  }
  const { products, cart } = await getProducts("../produtos/queryProducts.php");
  const total = products.reduce(
    (acc, product) => {
      if (!cart[product.id]) return acc
      return acc + cart[product.id].qtd * product.valor
    },
    0
  );
  renderProducts(products, cart);
  renderTotal(total);
}


window.addToCart = async function(id) {
  const user = JSON.parse(localStorage.getItem("user"))
  await query("./server/addProducts.php", {
    body: JSON.stringify({id, userId: user.id}),
    method: "POST"
  })
  onMount();
} 

window.removeFromCart = async function(id) {
  const user = JSON.parse(localStorage.getItem("user"))
  await query("./server/removeProducts.php", {
    body: JSON.stringify({id, userId: user.id}),
    method: "POST"
  })
  onMount();
} 

window.onload = onMount
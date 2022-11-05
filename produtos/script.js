import { query } from "../js/services.js";
import { render } from "../js/render.js";
const addToCartButton = (id, text) => {
  return `
  <button onclick="addToCart(${id})">
    ${text}
  </button>
  `;
}

 const removeFromCartButton = (id, text) => {
  return `
  <button onclick="removeFromCart(${id})">
    ${text}
  </button>
  `;
}

function populateProducts(products) {
  const ui = products
    .map((product) => {
      return `
    <li>
      <img src="${product.url}" alt="${product.nome}" />
      <div class="description">
        <h3>
          ${product.nome}
        </h3>
        <strong>
          ${returnFixedValue(product.valor)}
        </strong>
      </div>
      ${addToCartButton(product.id, "ADD TO CART")}
    </li>
    `;
    })
    .join("");

  render("products", `
  <ul class="produtos-lista">
    ${ui}
  </ul>
  `);
}

function returnFixedValue(value) {
  return "R$ " + value.toLocaleString('pt-BR', { minimumFractionDigits: 2 , style: 'currency', currency: 'BRL' })
}

async function onMount(){
  const { data, error } = await query(`./queryProducts.php`);
  populateProducts(data);
}

async function addToCart(id) {
  const user = JSON.parse(localStorage.getItem("user"))
  await query("../carrinho/server/addProducts.php", {
    body: JSON.stringify({id, userId: user.id}),
    method: "POST"
  })
}


window.onload = onMount
window.addToCart = addToCart
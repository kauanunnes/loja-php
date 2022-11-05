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
      Produto: ${product.nome}
      <br>
      Preço: ${product.valor}
      <br>
      id: ${product.id}
      <br>
      ${addToCartButton(product.id, "Adicionar ao carrinho")}
      ${removeFromCartButton(product.id, "Remover do carrinho")}
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

async function onMount(){
  const { data, error } = await query(`./queryProducts.php`);
  populateProducts(data);
}


window.onload = onMount
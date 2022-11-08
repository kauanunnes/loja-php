import { getProducts } from "../script.js";
import { render, html } from "../../js/render.js";
import { $ } from "../../js/getElement.js"
import { query } from "../../js/services.js";

function renderTotal(total) {
  if (total === 0) render("total", "");
  else render("total", html`<h2>Total: R$ ${total}</h2>`);
}

async function getTotal(userId) {
  const { products, cart } = await getProducts("../server/getCarrinho.php", { body: JSON.stringify({userId, method: "POST"}) });
  const total = products.reduce(
    (acc, product) => {
      if (!cart[product.id]) return acc
      return acc + cart[product.id].qtd * product.valor
    },
    0
  );
  return total
}

async function onMount() {
  const user = JSON.parse(localStorage.getItem("user"))
  if (!user) {
    window.location = "/login"
    return
  }
  const total = await getTotal(user.id);
  renderTotal(total);
}

async function submitPayment(e) {
  e.preventDefault();
  const user = localStorage.getItem("user");
  const userId = JSON.parse(user).id;
  const total = await getTotal(userId);
  const formData = {
    valor_total: total,
    tipo: $("tipo").value,
  };
  // verify is is logged in
  const { data, error } = await query("./checkout.php", {
    method: "POST",
    body: JSON.stringify({ formData, userId }),
    extraHeaders: {
      "Content-Type": "application/json",
    },
  });

  if (error) {
    console.log(error);
    // return alert(error);
  }
  form.reset();
  render("main", html`${data.msg}`);
}
window.submitPayment = submitPayment;
window.onload = onMount;
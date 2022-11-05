import { $ } from "./getElement.js";
/**
 * 
 * @param {string} id 
 * @param {string} content 
 */
export function render(id, content) {
  const html = $(id);
  html.innerHTML = content;
}

export const html = (strings, ...values) => String.raw({ raw: strings }, ...values);
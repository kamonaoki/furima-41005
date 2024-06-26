function post (){
  const price = document.getElementById("item-price")
  price.addEventListener("input", () => {
    const inputValue = price.value;
    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = Math.floor(inputValue/10)
    const salesProfit= document.getElementById('profit');
    salesProfit.innerHTML =inputValue -  Math.floor(inputValue/10)
  });
 };
 
 window.addEventListener('turbo:load', post);
 window.addEventListener("turbo:render", post);
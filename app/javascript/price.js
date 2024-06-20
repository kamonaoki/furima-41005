function post (){
  const price = document.getElementById("item-price")
  price.addEventListener("input", () => {
    const inputValue = price.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = Math.floor(inputValue/10)
    const salesProfit= document.getElementById('profit');
    salesProfit.innerHTML = Math.floor(inputValue*0.9)
  });
 };
 
 window.addEventListener('turbo:load', post);
function tax (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {

    const taxVal = Math.floor(itemPrice.value * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = taxVal;

    const profitVal = itemPrice.value - taxVal;
    const Profit = document.getElementById("profit");
    Profit.innerHTML = profitVal;

  });
};

window.addEventListener('turbo:load', tax);
window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const taxRate = 0.1;

  itemPrice.addEventListener("input", () => {
    const inputValue = parseInt(itemPrice.value);

    if (!isNaN(inputValue)) { 
      const calculatedTax = Math.floor(inputValue * taxRate);
      const calculatedProfit = Math.floor(inputValue - calculatedTax);

      addTaxPrice.textContent = `${calculatedTax}`;
      profit.textContent = `${calculatedProfit}`;
    } else {
      addTaxPrice.textContent = '0';
      profit.textContent = '0';
    }
  });
});
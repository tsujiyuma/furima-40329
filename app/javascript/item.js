function updatePrices() {
  const priceInput = document.querySelector("#item-price");
  const addTaxDom = document.querySelector("#add-tax-price");
  const profitPrice = document.querySelector("#profit");

  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    const inputValue2 = priceInput.value;
    profitPrice.innerHTML = Math.floor(inputValue2 - Number(addTaxDom.innerHTML) )
  });
  };

  window.addEventListener('turbo:load', updatePrices);
  window.addEventListener('turbo:render', updatePrices);
function taxCalculation() {
  const itemPrice = document.getElementById("item-price")
  const taxNode = document.getElementById("add-tax-price")
  const profitNode = document.getElementById("profit")
  const taxRate = 0.1
  let price = 0
  let tax = 0
  let profit = 0

  itemPrice.addEventListener('input', function(){
    price = this.value;
    tax = Math.round(price * taxRate)
    profit = price - tax
    taxNode.textContent = tax
    profitNode.textContent = profit
  })
}
window.addEventListener('load', taxCalculation)
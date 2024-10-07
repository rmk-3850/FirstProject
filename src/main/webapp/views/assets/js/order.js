let cnt = 0;
const frame = document.getElementById('frame');
const showBProductList = async function () {
	await axios.post('http://localhost:8080/FirstProject/OrderServlet', null, {
		headers: { 'demand': 'demandFrame' }
		})
		.then(res => {
			cnt++;
			
			const BProductList = res.data.BProductList;
			let newItem= document.createElement("div");
			newItem.setAttribute("id", `item${cnt}`);
			newItem.classList.add('row')
			let itemId = `item${cnt}`;
			let options = BProductList.map(value => {
				return `<option value="${value.product_B_code}">${value.product_name}</option>`;
			}).join('');
			newItem.innerHTML = `
				<div class="col-2 d-flex justify-content-center align-items-center">
					<select class="form-select" id="Bsort${cnt}" name="product_B_code" onchange="showProductList(${cnt})" >
						<option selected="selected" disabled>종류</option>
						${options}
					</select>
				</div>
				<div class="col-5 d-flex justify-content-center align-items-center" id="${itemId}col2" >
				</div>
				<div class="col-2 d-flex justify-content-center align-items-center" id="${itemId}col3"></div>
				<div class="col-2 d-flex justify-content-center align-items-center sum-div" id="${itemId}col4"></div>
				<div class="col-1 d-flex justify-content-center align-items-center" id="${itemId}col5">
					<button class="btn-order btn icon icon-left" onclick="removeProductList(${cnt})"><svg style="width: 30px; height: 30px;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M64 32C28.7 32 0 60.7 0 96L0 416c0 35.3 28.7 64 64 64l320 0c35.3 0 64-28.7 64-64l0-320c0-35.3-28.7-64-64-64L64 32zm79 143c9.4-9.4 24.6-9.4 33.9 0l47 47 47-47c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-47 47 47 47c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0l-47-47-47 47c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l47-47-47-47c-9.4-9.4-9.4-24.6 0-33.9z"/></svg></button>
				</div>`
			frame.appendChild(newItem);
		})
		.catch(err => {console.error('showBProductList 에러 : ', err)});
}

const showProductList = async function (cnt) {
	let Bsort = document.getElementById(`Bsort${cnt}`);
	let data = {product_B_code: Bsort.value};
	await axios.post('http://localhost:8080/FirstProject/OrderServlet', data, {
			headers: { 'demand': 'demandList' }
			})
		.then(res => {
			const productList = res.data.productList;
			let divnd = document.getElementById(`item${cnt}col2`);
			let options = productList.map(value => {
				return `<option value="${value.product_price}">${value.product_name}(${value.product_price}원)</option>`;
			}).join('');
			divnd.innerHTML = `
					<select class="form-select" id="sort${cnt}" name="product_name" onchange="showEa_Price(${cnt})" >
						<option selected="selected" disabled>종류</option>
						${options}
					</select>`
		})
		.catch(err => {console.error('showProductList 에러 : ', err)});
}

const removeProductList = function (cnt) {
	let item= document.getElementById(`item${cnt}`);	 
	if(item!== null) {
	     item.parentNode.removeChild(item);
	}          
}

const showEa_Price = function (cnt) {
	let div3rd = document.getElementById(`item${cnt}col3`);
	let sort = document.getElementById(`sort${cnt}`);
	let price = parseInt(sort.value);
	let div4rd = document.getElementById(`item${cnt}col4`);
	div3rd.innerHTML = `
		<input style="width: 150px;" class="form-control" id="ea${cnt}" type="number" min="1" placeholder="개수"> `
	let ea = document.getElementById(`ea${cnt}`);
	ea.addEventListener("input", ()=>{
		let sum = (price*ea.value).toLocaleString();
		div4rd.textContent = `${sum}원`;
	});
}

const btn= document.getElementById("btn");
btn.addEventListener("click", showBProductList);
let span= document.createElement("span");
span.id= 'sum_span';
span.setAttribute("class", "badge bg-primary");
span.style.marginLeft = "10px";
const totalsum_btn = document.getElementById("totalsum");
totalsum_btn.addEventListener("click", ()=>{
	let totalsum = 0;
	let sum_div = document.querySelectorAll(".sum-div");
	for(let div of sum_div){
		totalsum += parseInt(div.textContent.replace(/,/g,'').match(/\d+/g));
	}
	let footer = document.querySelector("#totalsum");
	footer.insertAdjacentElement("afterend", span);
	let sum_span = document.getElementById("sum_span");
	let sum = totalsum.toLocaleString();
	sum_span.textContent =  `총 ${sum}원`;
});

const orderBtn = document.getElementById("orderBtn");
orderBtn.addEventListener("click", ()=>{
	let sum_span = document.getElementById("sum_span");
	let totalsum = sum_span.textContent;
	
});
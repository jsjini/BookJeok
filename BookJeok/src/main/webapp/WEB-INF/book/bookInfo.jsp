<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 상세페이지 시작 -->
<div class="container text-center">

	<section class="mt-8">
	   <div class="container">
	      <div class="row">
	      	<!-- 좌측 이미지 -->
			<div class="col-md-6">
				<!-- img -->
				${vo.img}
				${vo.name}
				${vo.author}
				${vo.comp}
				${vo.price}
				${vo.dt}
				${vo.category}
				${vo.about}
			</div>
	        <!-- 우측 정보 -->
	        <div class="col-md-6">
	            <div class="ps-lg-10 mt-6 mt-md-0">
	
	               <!-- heading (책제목) -->
	               <h1 class="mb-1">${vo.name}</h1>
	               <div class="mb-4">
	                  <!-- rating (이것은 뭘까요....? 궁금) -->
	                  <small class="text-warning">
	                     <i class="bi bi-star-fill"></i>
	                     <i class="bi bi-star-fill"></i>
	                     <i class="bi bi-star-fill"></i>
	                     <i class="bi bi-star-fill"></i>
	                     <i class="bi bi-star-half"></i>
	                  </small>
	                  <a href="#" class="ms-2">(30 reviews)</a>
	               </div>
	               <div class="fs-4">
	                  <!-- price (책가격) -->
	                  <span class="fw-bold text-dark">$32</span>
	                  <span class="text-decoration-line-through text-muted">$35</span>
	                  <span><small class="fs-6 ms-2 text-danger">26% Off</small></span>
	               </div>
	               <!-- hr -->
	               <hr class="my-6">
	               
	               <div>
	                  <!-- input -->
	                  <div class="input-group input-spinner">
	                     <input type="button" value="-" class="button-minus btn btn-sm" data-field="quantity">
	                     <input type="number" step="1" max="10" value="1" name="quantity" class="quantity-field form-control-sm form-input">
	                     <input type="button" value="+" class="button-plus btn btn-sm" data-field="quantity">
	                  </div>
	               </div>
	               <div class="mt-3 row justify-content-start g-2 align-items-center">
	                  <div class="col-xxl-4 col-lg-4 col-md-5 col-5 d-grid">
	                     <!-- button -->
	                     <!-- btn -->
	                     <button type="button" class="btn btn-primary">
	                        <i class="feather-icon icon-shopping-bag me-2"></i>
	                        Add to cart
	                     </button>
	                  </div>
	                  <div class="col-md-4 col-4">
	                     <!-- btn -->
	                     <a class="btn btn-light" href="#" data-bs-toggle="tooltip" data-bs-html="true" aria-label="Compare"><i class="bi bi-arrow-left-right"></i></a>
	                     <a class="btn btn-light" href="shop-wishlist.html" data-bs-toggle="tooltip" data-bs-html="true" aria-label="Wishlist"><i class="feather-icon icon-heart"></i></a>
	                  </div>
	               </div>
	               <!-- hr -->
	               <hr class="my-6">
	               <div>
	                  <!-- table -->
	                  <table class="table table-borderless mb-0">
	                     <tbody>
	                        <tr>
	                           <td>ISBN code:</td>
	                           <td>${vo.isbn }</td>
	                        </tr>
	                        <tr>
	                           <td>Availability:</td>
	                           <td>In Stock</td>
	                        </tr>
	                        <tr>
	                           <td>Type:</td>
	                           <td>Fruits</td>
	                        </tr>
	                        <tr>
	                           <td>Shipping:</td>
	                           <td>
	                              <small>
	                                 01 day shipping.
	                                 <span class="text-muted">( Free pickup today)</span>
	                              </small>
	                           </td>
	                        </tr>
	                     </tbody>
	                  </table>
	               </div>
	   
	            </div>
	        </div>
	      	<!-- 우측 정보 끝. -->
	      </div>
	   </div>
	</section>
	
	<!-- 하단 탭 메뉴(상세정보 및 리뷰) -->
	<section class="mt-lg-14 mt-8">
	   <div class="container">
	      <div class="row">
	         <div class="col-md-12">
	            <ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
	               <!-- nav item -->
	               <li class="nav-item" role="presentation">
	                  <!-- btn (상세정보 탭) -->
	                  <button class="nav-link active" id="product-tab" data-bs-toggle="tab" data-bs-target="#product-tab-pane" type="button" role="tab" aria-controls="product-tab-pane" aria-selected="true">
	                     상세정보
	                  </button>
	               </li>
	               <!-- nav item : (리뷰 탭) -->
	               <li class="nav-item" role="presentation">
	                  <!-- btn -->
	                  <button class="nav-link" id="details-tab" data-bs-toggle="tab" data-bs-target="#details-tab-pane" type="button" role="tab" aria-controls="details-tab-pane" aria-selected="false" tabindex="-1">
	                     리뷰
	                  </button>
	               </li>
	               
	            </ul>
	            <!-- tab content -->
	            <div class="tab-content" id="myTabContent">
	               <!-- tab pane -->
	               <div class="tab-pane fade show active" id="product-tab-pane" role="tabpanel" aria-labelledby="product-tab" tabindex="0">
	                  <div class="my-8">
	                     <div class="mb-5">
	                        <!-- text -->
	                        <h4 class="mb-1">Nutrient Value &amp; Benefits</h4>
	                        <p class="mb-0">
	                           Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisi, tellus iaculis urna bibendum in lacus, integer. Id imperdiet vitae varius sed magnis eu nisi nunc
	                           sit. Vel, varius habitant ornare ac rhoncus. Consequat risus facilisis ante ipsum netus risus adipiscing sagittis sed. Lorem ipsum dolor sit amet, consectetur
	                           adipiscing elit.
	                        </p>
	                     </div>
	                     <div class="mb-5">
	                        <h5 class="mb-1">Storage Tips</h5>
	                        <p class="mb-0">
	                           Nisi, tellus iaculis urna bibendum in lacus, integer. Id imperdiet vitae varius sed magnis eu nisi nunc sit. Vel, varius habitant ornare ac rhoncus. Consequat risus
	                           facilisis ante ipsum netus risus adipiscing sagittis sed.Lorem ipsum dolor sit amet, consectetur adipiscing elit.
	                        </p>
	                     </div>
	                     <!-- content -->
	                     <div class="mb-5">
	                        <h5 class="mb-1">Unit</h5>
	                        <p class="mb-0">3 units</p>
	                     </div>
	                     <div class="mb-5">
	                        <h5 class="mb-1">Seller</h5>
	                        <p class="mb-0">DMart Pvt. LTD</p>
	                     </div>
	                     <div>
	                        <h5 class="mb-1">Disclaimer</h5>
	                        <p class="mb-0">
	                           Image shown is a representation and may slightly vary from the actual product. Every effort is made to maintain accuracy of all information displayed.
	                        </p>
	                     </div>
	                  </div>
	               </div>
	               <!-- tab pane -->
	               <div class="tab-pane fade" id="details-tab-pane" role="tabpanel" aria-labelledby="details-tab" tabindex="0">
	                  <div class="my-8">
	                     <div class="row">
	                        <div class="col-12">
	                           <h4 class="mb-4">Details</h4>
	                        </div>
	                        <div class="col-12 col-lg-6">
	                           <table class="table table-striped">
	                              <!-- table -->
	                              <tbody>
	                                 <tr>
	                                    <th>Weight</th>
	                                    <td>1000 Grams</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Ingredient Type</th>
	                                    <td>Vegetarian</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Brand</th>
	                                    <td>Dmart</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Item Package Quantity</th>
	                                    <td>1</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Form</th>
	                                    <td>Larry the Bird</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Manufacturer</th>
	                                    <td>Dmart</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Net Quantity</th>
	                                    <td>340.0 Gram</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Product Dimensions</th>
	                                    <td>9.6 x 7.49 x 18.49 cm</td>
	                                 </tr>
	                              </tbody>
	                           </table>
	                        </div>
	                        <div class="col-12 col-lg-6">
	                           <table class="table table-striped">
	                              <!-- table -->
	                              <tbody>
	                                 <tr>
	                                    <th>ASIN</th>
	                                    <td>SB0025UJ75W</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Best Sellers Rank</th>
	                                    <td>#2 in Fruits</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Date First Available</th>
	                                    <td>30 April 2022</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Item Weight</th>
	                                    <td>500g</td>
	                                 </tr>
	                                 <tr>
	                                    <th>Generic Name</th>
	                                    <td>Banana Robusta</td>
	                                 </tr>
	                              </tbody>
	                           </table>
	                        </div>
	                     </div>
	                  </div>
	               </div>
	               <!-- tab pane -->
	               <div class="tab-pane fade" id="reviews-tab-pane" role="tabpanel" aria-labelledby="reviews-tab" tabindex="0">
	                  <div class="my-8">
	                     <!-- row -->
	                     <div class="row">
	                        <div class="col-md-4">
	                           <div class="me-lg-12 mb-6 mb-md-0">
	                              <div class="mb-5">
	                                 <!-- title -->
	                                 <h4 class="mb-3">Customer reviews</h4>
	                                 <span>
	                                    <!-- rating -->
	                                    <small class="text-warning">
	                                       <i class="bi bi-star-fill"></i>
	                                       <i class="bi bi-star-fill"></i>
	                                       <i class="bi bi-star-fill"></i>
	                                       <i class="bi bi-star-fill"></i>
	                                       <i class="bi bi-star-half"></i>
	                                    </small>
	                                    <span class="ms-3">4.1 out of 5</span>
	                                    <small class="ms-3">11,130 global ratings</small>
	                                 </span>
	                              </div>
	                              <div class="mb-8">
	                                 <!-- progress -->
	                                 <div class="d-flex align-items-center mb-2">
	                                    <div class="text-nowrap me-3 text-muted">
	                                       <span class="d-inline-block align-middle text-muted">5</span>
	                                       <i class="bi bi-star-fill ms-1 small text-warning"></i>
	                                    </div>
	                                    <div class="w-100">
	                                       <div class="progress" style="height: 6px">
	                                          <div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
	                                       </div>
	                                    </div>
	                                    <span class="text-muted ms-3">53%</span>
	                                 </div>
	                                 <!-- progress -->
	                                 <div class="d-flex align-items-center mb-2">
	                                    <div class="text-nowrap me-3 text-muted">
	                                       <span class="d-inline-block align-middle text-muted">4</span>
	                                       <i class="bi bi-star-fill ms-1 small text-warning"></i>
	                                    </div>
	                                    <div class="w-100">
	                                       <div class="progress" style="height: 6px">
	                                          <div class="progress-bar bg-warning" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="50"></div>
	                                       </div>
	                                    </div>
	                                    <span class="text-muted ms-3">22%</span>
	                                 </div>
	                                 <!-- progress -->
	                                 <div class="d-flex align-items-center mb-2">
	                                    <div class="text-nowrap me-3 text-muted">
	                                       <span class="d-inline-block align-middle text-muted">3</span>
	                                       <i class="bi bi-star-fill ms-1 small text-warning"></i>
	                                    </div>
	                                    <div class="w-100">
	                                       <div class="progress" style="height: 6px">
	                                          <div class="progress-bar bg-warning" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="35"></div>
	                                       </div>
	                                    </div>
	                                    <span class="text-muted ms-3">14%</span>
	                                 </div>
	                                 <!-- progress -->
	                                 <div class="d-flex align-items-center mb-2">
	                                    <div class="text-nowrap me-3 text-muted">
	                                       <span class="d-inline-block align-middle text-muted">2</span>
	                                       <i class="bi bi-star-fill ms-1 small text-warning"></i>
	                                    </div>
	                                    <div class="w-100">
	                                       <div class="progress" style="height: 6px">
	                                          <div class="progress-bar bg-warning" role="progressbar" style="width: 22%" aria-valuenow="22" aria-valuemin="0" aria-valuemax="22"></div>
	                                       </div>
	                                    </div>
	                                    <span class="text-muted ms-3">5%</span>
	                                 </div>
	                                 <!-- progress -->
	                                 <div class="d-flex align-items-center mb-2">
	                                    <div class="text-nowrap me-3 text-muted">
	                                       <span class="d-inline-block align-middle text-muted">1</span>
	                                       <i class="bi bi-star-fill ms-1 small text-warning"></i>
	                                    </div>
	                                    <div class="w-100">
	                                       <div class="progress" style="height: 6px">
	                                          <div class="progress-bar bg-warning" role="progressbar" style="width: 14%" aria-valuenow="14" aria-valuemin="0" aria-valuemax="14"></div>
	                                       </div>
	                                    </div>
	                                    <span class="text-muted ms-3">7%</span>
	                                 </div>
	                              </div>
	                              <div class="d-grid">
	                                 <h4>Review this product</h4>
	                                 <p class="mb-0">Share your thoughts with other customers.</p>
	                                 <a href="#" class="btn btn-outline-gray-400 mt-4 text-muted">Write the Review</a>
	                              </div>
	                           </div>
	                        </div>
	                        <!-- col -->
	                        <div class="col-md-8">
	                           <div class="mb-10">
	                              <div class="d-flex justify-content-between align-items-center mb-8">
	                                 <div>
	                                    <!-- heading -->
	                                    <h4>Reviews</h4>
	                                 </div>
	                                 <div>
	                                    <select class="form-select">
	                                       <option selected="">Top Reviews</option>
	                                       <option value="Most Recent">Most Recent</option>
	                                    </select>
	                                 </div>
	                              </div>
	                              <div class="d-flex border-bottom pb-6 mb-6">
	                                 <!-- img -->
	                                 <!-- img -->
	                                 <img src="../assets/images/avatar/avatar-10.jpg" alt="" class="rounded-circle avatar-lg">
	                                 <div class="ms-5">
	                                    <h6 class="mb-1">Shankar Subbaraman</h6>
	                                    <!-- select option -->
	                                    <!-- content -->
	                                    <p class="small">
	                                       <span class="text-muted">30 December 2022</span>
	                                       <span class="text-primary ms-3 fw-bold">Verified Purchase</span>
	                                    </p>
	                                    <!-- rating -->
	                                    <div class="mb-2">
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <span class="ms-3 text-dark fw-bold">Need to recheck the weight at delivery point</span>
	                                    </div>
	                                    <!-- text-->
	                                    <p>
	                                       Product quality is good. But, weight seemed less than 1kg. Since it is being sent in open package, there is a possibility of pilferage in between.
	                                       FreshCart sends the veggies and fruits through sealed plastic covers and Barcode on the weight etc. .
	                                    </p>
	                                    <div>
	                                       <div class="border icon-shape icon-lg border-2">
	                                          <!-- img -->
	                                          <img src="../assets/images/products/product-img-1.jpg" alt="" class="img-fluid">
	                                       </div>
	                                       <div class="border icon-shape icon-lg border-2 ms-1">
	                                          <!-- img -->
	                                          <img src="../assets/images/products/product-img-2.jpg" alt="" class="img-fluid">
	                                       </div>
	                                       <div class="border icon-shape icon-lg border-2 ms-1">
	                                          <!-- img -->
	                                          <img src="../assets/images/products/product-img-3.jpg" alt="" class="img-fluid">
	                                       </div>
	                                    </div>
	                                    <!-- icon -->
	                                    <div class="d-flex justify-content-end mt-4">
	                                       <a href="#" class="text-muted">
	                                          <i class="feather-icon icon-thumbs-up me-1"></i>
	                                          Helpful
	                                       </a>
	                                       <a href="#" class="text-muted ms-4">
	                                          <i class="feather-icon icon-flag me-2"></i>
	                                          Report abuse
	                                       </a>
	                                    </div>
	                                 </div>
	                              </div>
	                              <div class="d-flex border-bottom pb-6 mb-6 pt-4">
	                                 <!-- img -->
	                                 <img src="../assets/images/avatar/avatar-12.jpg" alt="" class="rounded-circle avatar-lg">
	                                 <div class="ms-5">
	                                    <h6 class="mb-1">Robert Thomas</h6>
	                                    <!-- content -->
	                                    <p class="small">
	                                       <span class="text-muted">29 December 2022</span>
	                                       <span class="text-primary ms-3 fw-bold">Verified Purchase</span>
	                                    </p>
	                                    <!-- rating -->
	                                    <div class="mb-2">
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star text-warning"></i>
	                                       <span class="ms-3 text-dark fw-bold">Need to recheck the weight at delivery point</span>
	                                    </div>
	
	                                    <p>
	                                       Product quality is good. But, weight seemed less than 1kg. Since it is being sent in open package, there is a possibility of pilferage in between.
	                                       FreshCart sends the veggies and fruits through sealed plastic covers and Barcode on the weight etc. .
	                                    </p>
	
	                                    <!-- icon -->
	                                    <div class="d-flex justify-content-end mt-4">
	                                       <a href="#" class="text-muted">
	                                          <i class="feather-icon icon-thumbs-up me-1"></i>
	                                          Helpful
	                                       </a>
	                                       <a href="#" class="text-muted ms-4">
	                                          <i class="feather-icon icon-flag me-2"></i>
	                                          Report abuse
	                                       </a>
	                                    </div>
	                                 </div>
	                              </div>
	                              <div class="d-flex border-bottom pb-6 mb-6 pt-4">
	                                 <!-- img -->
	                                 <img src="../assets/images/avatar/avatar-9.jpg" alt="" class="rounded-circle avatar-lg">
	                                 <div class="ms-5">
	                                    <h6 class="mb-1">Barbara Tay</h6>
	                                    <!-- content -->
	                                    <p class="small">
	                                       <span class="text-muted">28 December 2022</span>
	                                       <span class="text-danger ms-3 fw-bold">Unverified Purchase</span>
	                                    </p>
	                                    <!-- rating -->
	                                    <div class="mb-2">
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star text-warning"></i>
	                                       <span class="ms-3 text-dark fw-bold">Need to recheck the weight at delivery point</span>
	                                    </div>
	
	                                    <p>Everytime i ordered from fresh i got greenish yellow bananas just like i wanted so go for it , its happens very rare that u get over riped ones.</p>
	
	                                    <!-- icon -->
	                                    <div class="d-flex justify-content-end mt-4">
	                                       <a href="#" class="text-muted">
	                                          <i class="feather-icon icon-thumbs-up me-1"></i>
	                                          Helpful
	                                       </a>
	                                       <a href="#" class="text-muted ms-4">
	                                          <i class="feather-icon icon-flag me-2"></i>
	                                          Report abuse
	                                       </a>
	                                    </div>
	                                 </div>
	                              </div>
	                              <div class="d-flex border-bottom pb-6 mb-6 pt-4">
	                                 <!-- img -->
	                                 <img src="../assets/images/avatar/avatar-8.jpg" alt="" class="rounded-circle avatar-lg">
	                                 <div class="ms-5 flex-grow-1">
	                                    <h6 class="mb-1">Sandra Langevin</h6>
	                                    <!-- content -->
	                                    <p class="small">
	                                       <span class="text-muted">8 December 2022</span>
	                                       <span class="text-danger ms-3 fw-bold">Unverified Purchase</span>
	                                    </p>
	                                    <!-- rating -->
	                                    <div class="mb-2">
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star-fill text-warning"></i>
	                                       <i class="bi bi-star text-warning"></i>
	                                       <span class="ms-3 text-dark fw-bold">Great product</span>
	                                    </div>
	
	                                    <p>Great product &amp; package. Delivery can be expedited.</p>
	
	                                    <!-- icon -->
	                                    <div class="d-flex justify-content-end mt-4">
	                                       <a href="#" class="text-muted">
	                                          <i class="feather-icon icon-thumbs-up me-1"></i>
	                                          Helpful
	                                       </a>
	                                       <a href="#" class="text-muted ms-4">
	                                          <i class="feather-icon icon-flag me-2"></i>
	                                          Report abuse
	                                       </a>
	                                    </div>
	                                 </div>
	                              </div>
	                              <div>
	                                 <a href="#" class="btn btn-outline-gray-400 text-muted">Read More Reviews</a>
	                              </div>
	                           </div>
	                           <div>
	                              <!-- rating -->
	                              <h3 class="mb-5">Create Review</h3>
	                              <div class="border-bottom py-4 mb-4">
	                                 <h4 class="mb-3">Overall rating</h4>
	                                 <div class="rater star-rating" style="width: 100px; height: 20px; background-size: 20px;"><div class="star-value" style="background-size: 20px; width: 0px;"></div></div>
	                              </div>
	                              <div class="border-bottom py-4 mb-4">
	                                 <h4 class="mb-0">Rate Features</h4>
	                                 <div class="my-5">
	                                    <h5>Flavor</h5>
	                                    <div class="rater star-rating" style="width: 100px; height: 20px; background-size: 20px;"><div class="star-value" style="background-size: 20px; width: 0px;"></div></div>
	                                 </div>
	                                 <div class="my-5">
	                                    <h5>Value for money</h5>
	                                    <div class="rater star-rating" style="width: 100px; height: 20px; background-size: 20px;"><div class="star-value" style="background-size: 20px; width: 0px;"></div></div>
	                                 </div>
	                                 <div class="my-5">
	                                    <h5>Scent</h5>
	                                    <div class="rater star-rating" style="width: 100px; height: 20px; background-size: 20px;"><div class="star-value" style="background-size: 20px; width: 0px;"></div></div>
	                                 </div>
	                              </div>
	                              <!-- form control -->
	                              <div class="border-bottom py-4 mb-4">
	                                 <h5>Add a headline</h5>
	                                 <input type="text" class="form-control" placeholder="What’s most important to know">
	                              </div>
	                              <div class="border-bottom py-4 mb-4">
	                                 <h5>Add a photo or video</h5>
	                                 <p>Shoppers find images and videos more helpful than text alone.</p>
	
	                                 <div id="my-dropzone" class="dropzone mt-4 border-dashed rounded-2 min-h-0 dz-clickable"><div class="dz-default dz-message"><button class="dz-button" type="button">Drop files here to upload</button></div></div>
	                              </div>
	                              <div class="py-4 mb-4">
	                                 <!-- heading -->
	                                 <h5>Add a written review</h5>
	                                 <textarea class="form-control" rows="3" placeholder="What did you like or dislike? What did you use this product for?"></textarea>
	                              </div>
	                              <!-- button -->
	                              <div class="d-flex justify-content-end">
	                                 <a href="#" class="btn btn-primary">Submit Review</a>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
	                  </div>
	               </div>
	               <!-- tab pane -->
	               <div class="tab-pane fade" id="sellerInfo-tab-pane" role="tabpanel" aria-labelledby="sellerInfo-tab" tabindex="0">...</div>
	            </div>
	         </div>
	      </div>
	   </div>
	</section>
	<!-- 하단 탭 메뉴(상세정보 및 리뷰) 끝. -->
	
		
</div>
<!-- 상세페이지 끝. -->
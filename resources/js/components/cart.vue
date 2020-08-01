<template>
  <div id="app">
    <div v-if="status">
      <div class="alert alert-success alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Item Added!</strong> {{ProductAddInCart}} .
      </div>
    </div>
    <!--this table browse all product bougth-->
    <div class="table-responsive">
      <table class="table table-hover">
        <thead>
          <tr>
            <th>product</th>
            <th>product name</th>
            <th>price </th>
            <th>totle price</th>
            <th>count</th>
            <th>status</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, key) in arr">
            <td>
              <img :src='"/storage/"+item.image_url' :alt='"/storage/"+item.image_url'width="100px"height="50px">
            </td>
            <td>{{item.name}}</td>
            <td><b :class="'price'+item.id">{{ item.price }} $</b></td>
            <td><b :class="'totalprice'+item.id">{{ Math.ceil((GetIteration(products,item.id)*parseFloat(item.price))*100)/100 }} $</b></td>
            <td :id="'countOfItem'+item.id"> {{ GetIteration(products,item.id) }}</td>
            <td>
              <br>
              <div class="d-inline">
                <input disabled class="form-control d-inline col-sm-5 col-md-2 col-lg-2" type="number" :id="'input'+item.id" :value="GetIteration(products,item.id)">
                <button class="btn btn-primary d-inline mb-1  col-md-2" type="button":id="item.id"  @click="PlusItem($event)">
                  <span class="fa fa-plus"></span>
                </button>
                <button class="btn btn-danger d-inline mb-1 col-md-2" type="button" :id="item.id" @click="Delete($event)">
                  <span class="fas fa-minus"></span>
                </button>
              </div>
            </td>
          </tr>
          <tr>
            <td>-</td><td>-</td><td>-</td>
            <td><b class="EndPrice">{{Math.ceil(totalprice*100)/100}} $</b></td>
            <td><b id="TotalCountOfItem">{{this.products.length}}</b></td>
            <td>-</td>
          </tr>
        </tbody>
      </table>
    </div>
    <!---->


    <table class="table table-bordered borderd w-25 font-weight-bold mb-2">
      <tr>
        <td>Total</td>
        <td class="EndPrice">{{Math.ceil(totalprice*100)/100}} $</td>
      </tr>
      <tr>
        <td>finish Total</td>
        <td class="EndPrice">{{Math.ceil(totalprice*100)/100}} $</td>
      </tr>
    </table>

    <section>
      <div v-if="products.length >0" class="mb-5">
        <!--<button @click="Create($event)" class="btn btn-primary">Finish Order</button>-->
        <button type="button" class="btn btn-primary"data-toggle="modal" data-target="#chooseWayBay">Finish Order</button>
        <button type="button" class="btn btn-primary"data-toggle="modal" data-target="#myModal">Coupon Code</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title text-left">You Have Coupon Code? </h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">
                <section class="mb-5">
                  <input type="text"class="form-control" name="" placeholder="Enter Coupon Code"style="width:250px">
                  <button type="button" name="button"class="text-success form-control mt-2"style="width:150px">Apply Coupon</button>
                </section>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <!--End Modal1 -->

        <!-- Modal Choose Way Bay (2)-->
        <div class="modal fade" id="chooseWayBay" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title text-left">Choose Payment Way: </h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">
                <section class="mb-5">
                  <form class="" v-on:submit.prevent="Choose($event)" action="#" method="get">
                    <div class="custom-control custom-radio">
                      <input required type="radio" class="custom-control-input" id="delivery" name="way" value="delivery">
                      <label class="custom-control-label" for="delivery">
                        <h5>Cash On Delivery </h5>
                        <h6>
                          Cash On Delivery
                          <span class="fa fa-money"></span>
                        </h6>
                      </label><br><br>
                    </div>
                    <div class="custom-control custom-radio">
                      <input required type="radio" class="custom-control-input" id="Paypal" name="way" value="Paypal">
                      <label class="custom-control-label" for="Paypal">
                        <h5>Paypal Standard  </h5>
                        <h6>
                          Paypal Standard
                          <span class="fa fa-cc-paypal"></span>
                        </h6>
                      </label>
                    </div>
                    <button type="submit" name="button"class="text-success form-control mt-4 float-right"style="width:150px">Continue <span class="fa fa-arrow-right"></span> </button>
                  </form>
                </section>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <!--End Modal1 -->

        <!-- Modal Payment Method Way Bay (3)-->
        <div class="modal fade" id="PaymentMethod" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title text-left">Payment Way: </h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">
                <section class="mb-5">
                  <!--<h5 id="wating">Please Wating ....</h5>-->
                  <div class=""id="paymentFormSection">

                  </div>
                  <!--empty section -->
                  <div id="messageSection" class="alter alter-success">

                  </div>

                </section>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <!--End Modal2 -->

      </div>
      <div v-else>
        <button disabled class="btn btn-primary">Continue...</button>
      </div>
    </section>
  </div>
</template>


<script>
export default {
  data() {
    return {
      products:[],
      cart:[],
      arr:[],
      status:false,
      ProductAddInCart:'',
      totalprice:0.0,
      coun:0,
      latitude:0,
      longitude:0,
      secretId:null,
    }
  },
  created() {
    this.Index();
    console.log("Created Method (2)");
    //this.ReadSessionMessage();
    //this.readSession();
  },
  methods: {
    readSession(){
      axios.get('/payment/readSession')
      .then(function(response){
        console.log('hay you are here in readSession methods');
        console.log(response.data);
        $('#PaymentMethod').modal('toggle');
        $('#messageSection').text(response.data);
        $('#paymentFormSection').empty().html(response.data.content);


      }).catch(function(response){
        console.log('hay you are here in readSession methods put there some problem here');
        console.error(response.data);

      })
    },
    ReadSessionMessage(){
      axios.get('/payment/pay')
      .then(function(response){
        console.log('hay please look here and foucse more down here');
        console.log(response);
      }).catch(function(){
        alert('There Some Error Here In ReadSessionMessage Methods');
        console.error('There Some Error Here');
      })
    },
    Choose($event){
      var that = this;

      if ($event.target.way.value == 'Paypal') {
        $('#chooseWayBay').modal('toggle');
        axios.post('/payment/pay',{
          price : that.price,
        }).then(function(response){
          //that.secretId = response.data.id;
          $('#PaymentMethod').modal('toggle');
          $('#paymentFormSection').text('<div>Please Wating ...</div>');
          $('#paymentFormSection').empty().html(response.data.content);

        }).catch(function(error){
          console.error('hay there error here please check out agein');
          alert(response.data);
        }).finally(function(response){

        })
      } else if ($event.target.way.value == 'delivery') {
        var that = this;
        that.Create($event);
      }
    },
    Create($event){
      console.log($event.target.way.value);
      navigator.geolocation.getCurrentPosition(pos => {
      this.latitude = pos.coords.latitude;
      this.longitude = pos.coords.longitude;
      if(this.latitude == null || this.longitude == null){
      alert("You Can`t Completed This Process So Try Agin Sorry To Help You You Shall Turn On JPS");
    }else {
    axios.post('/order',{
      latitude:this.latitude,
      longitude:this.longitude,
    })
    .then(function(response){
      alert('Done');
      var that = this;
      location.reload();
      console.log(response.data);
    })
    .catch(function(error){
      console.error(error);
      //location.href = '../../login';
    })
    .finally(function(){
    })
    }
  }, err => {
  alert("You Shall For Completed This Process Open GPS Location Please")
})
},
Store(id){
  var that = this;
  that.cart = [];
  axios.post('/product',{
    name: event.name,
    id: id,
    quantity:1,
  })
  .then(function (response) {
    for (var index = 0; index < response.data.length; index++) {
      that.cart.push(response.data[index]);
    }
    $("#counterofitems").text(response.data.length);
    $("#TotalCountOfItem").text(response.data.length);
    that.Index();
  })
  .catch(function (error) {
    location.reload()
    console.log(error);
  })
  .finally(function () {
    // always executed
  });
},
Delete(event){
  var that = this;
  that.cart = [];
  axios.delete('/product/'+event.target.id,{
    id: event.target.id,
  })
  .then(function (response) {
    for (var index = 0; index < response.data.length; index++) {
      that.cart.push(response.data[index]);
    }
    console.log(response.data);
    $(document).ready(function(){
      $("#counterofitems").text(response.data.length);
      that.Index();
    });
  })
  .catch(function (error) {
    // handle error
    console.log(error);
    //location.href="../Routing";
  })
  .finally(function () {
    // always executed
  });
},
Index(){
  var that = this;
  that.products = [];
  that.totalprice = 0;
  axios.get('/cart')
  .then(function(response){
    for (var index = 0; index < response.data.length; index++) {
      that.products.push(response.data[index]);
      that.totalprice += parseFloat(response.data[index].price);
    }
    console.log("index function ");
    console.log(that.products);
    $("#counterofitems").text(response.data.length);
    that.fillterDuplicate();
  }).catch(function(){
    location.reload();
  }).finally(function(){
    console.log('The End Method (Index) Has Been Loaded Cart');
  });
},
fillterDuplicate(){
  const unique = this.products
  .map(e => e['id'])
  // store the keys of the unique objects
  .map((e, i, final) => final.indexOf(e) === i && i)
  // eliminate the dead keys & store unique objects
  .filter(e => this.products[e]).map(e => this.products[e]);
  this.arr = unique;
},
AlertMessage(name){
  var that = this;
  that.ProductAddInCart = name;
  that.status = true;
  setTimeout(() => {
    that.status = false;
  }, 3500)
},
GetIteration(arr,item){
  var counter = 0;
  for (var i = 0; i < arr.length; i++) {
    if (arr[i].id == item) {
      counter++;
    }
  }
  return counter;
},
PlusItem(ref){
  var that = this;
  that.Store(ref.target.id);
},
MinusItem(ref){
  var val = ($('.countingFiled'+ref.target.id).val());
  if(val > 1){
    ($('.countingFiled'+ref.target.id).val(parseInt(val)-1));
  }else {
    $('.countingFiled'+ref.target.id).text('1');
  }
}
}
};
</script>

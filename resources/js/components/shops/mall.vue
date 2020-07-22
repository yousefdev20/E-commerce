<template>
  <div id="app">
    <div v-if="status">
      <div class="alert alert-success alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Item Added!</strong> {{ProductAddInCart}} .
      </div>
    </div>
    <div class="row">
      <div class="col-lg-3 col-md-4" v-for="(item, index) in products" :key="">
        <div class="card mb-2" :id="item.id+'card'">
          <div class="card-body">
            <img :src='"/storage/"+item.image_url ' alt="Rounded image" width="250px" height="200px"class="card-img-top rounded w-100">
          </div>
          <b class="mt-2 text-center h5">{{item.name}}</b>
          <pre class="text-success d-inline pl-3"><b class="font-weight-bold h5">$ {{item.price}} {{ item.weight_name }}</b></pre>
        <div class="mb-2 ml-4">
          <div class=" d-inline float-right d-inline">
            <button :name="item.name" class="btn btn-primary w-25 mb-1":id="item.id"@click="Store(item)">
              <span :name="item.name" :id="item.id" class="fa fa-plus" @click="Store($event)"></span>
            </button>
            <input type="number" value="1" class="form-control d-inline w-25"max="9" :id="item.id+'quantity'">
            <button class="btn btn-danger w-25 d-inline mb-1" :id="item.id"@click="DeleteItemFromCart($event)">
              <span :id="item.id" class="fa fa-trash"></span>
            </button>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      products:[],
      cart:[],
      status:false,
      ProductAddInCart:'',
    }
  },
  created() {
    this.Index();
  },
  //store->post, index, create, show, update, destroy, edit
  methods: {
    Store(event){
      var that = this;
      that.cart = [];
      axios.post('/product',{
        name: event.name,
        id: event.id,
        image_url:event.image_url,
        price:event.price,
        quantity:($('#'+event.id+'quantity').val()),
      })
      .then(function (response) {
        for (var index = 0; index < response.data.length; index++) {
          that.cart.push(response.data[index]);
        }
        $("#counterofitems").text(response.data.length);
        that.AlertMessage(event.name,event.id);
      })
      .catch(function (error) {
        location.reload()
        console.log(error);
      })
      .finally(function () {
        // always executed
      });
    },
    Index(){
      var that = this;
      that.products = [];
      axios.get('/goods/mall/load')
      .then(function (response) {
        for (var index = 0; index < response.data.length; index++) {
          that.products.push(response.data[index]);
        }
        console.log(response.data);
      })
      .catch(function (error) {
        // handle error
        console.log(error);
      })
      .finally(function () {
        // always executed
      });
    },
    Delete(event){
      var that = this;
      that.cart = [];
      axios.get('/shopping/'+ event.target.id,{

      })
      .then(function (response) {
        for (var index = 0; index < response.data.length; index++) {
          that.cart.push(response.data[index]);
        }
        console.log(response.data.length);
        $(document).ready(function(){
          $("#counterofitems").text(response.data.length);
        });
        $('#'+id+'card').css('background','white');
      })
      .catch(function (error) {
        // handle error
        console.log(error);
        location.href="../Routing";
      })
      .finally(function () {
        // always executed
      });

    },
    AlertMessage(name,id){
      var that = this;
      $('#'+id+'card').css('background','#d7f3e3');
      that.ProductAddInCart = name;
      that.status = true;

      setTimeout(() => {
        that.status = false;
    }, 3500)
    },
  }
};
</script>

<link rel="stylesheet" href="style.css" />

<div class="container form-container" >
<div class="row form-row" style="width: 100%;">
    <div class="col" style="width: 100%;">
        <form role="form" method="post" action="main.php">
            <div class="form-group row">
                <label for="inputEmail" class="col-sm-3 col-form-label">Email</label>
                <div class="col-sm-9">
                <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Email">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputUser" class="col-sm-3 col-form-label"> Name</label>
                <div class="col-sm-9">
                <input type="text" class="form-control" id="inputUser" name="name" placeholder="Username" required="true">
                </div>
            </div>
            <div class="form-group row">
                <div class=" col-sm-12 button-row">
                <input type="submit" value="Sign in" name="submit" class="btn btn-primary signin-btn"/>
                </div>
            </div>
        </form>
</div>
</div>
</div>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=960">
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<meta name="robots" content="noindex,nofollow">
		<title>[<% ident(); %>]: Basic</title>
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link rel="shortcut icon" href="/favicon.ico" />
		<% css(); %>

		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="tomato.js"></script>
		<script type="text/javascript" src="js/advancedtomato.js"></script>

		<script type="text/javascript">
			var routerName = '[<% ident(); %>] ';
			//<% nvram("web_nav,at_update,at_navi,tomatoanon_answer"); %>
			//<% anonupdate(); %>
			// Fix for system data display
			var refTimer, wl_ifaces = {}, ajaxLoadingState = false, gui_version = "<% version(0); %>";

			$(document).ready(function() {

				gui_version = gui_version.match(/^1.28\.0000 (MIPSR2\-)?(.*)/)[2] || '';
				$('#gui-version').html('<i class="icon-info-alt"></i> <span class="nav-collapse-hide">' + gui_version + '</span>');
				AdvancedTomato();

			});
		</script>
	</head>
	<body>
		<div id="wrapper">

			<div class="top-header">

				<div class="logo">
					<a href="/">
						<h1 class="nav-collapse-hide">AdvancedTomato</h1>
						<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="26px" height="26px" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve"><path class="logo-svg" fill-rule="evenodd" clip-rule="evenodd" fill="#ffffff" d="M19.491,.665c-.139,.542-.202,.609-.481,.97 c-.081,0-.161,0-.241,0c-.636,.936-1.119,2.172-1.204,3.637c0.556-.142,.581-.214,.964-.485c0-.081,0-.162,0-.243 c0.562-.081,1.124-.162,1.685-.242c0-.081,0-.162,0-.243c0.321,0,.642,0,.964,0c0,.081,0,.162,0,.243 c0.984,.258,2.744-.008,3.371-.243c0,.162,0,.323,0,.485c-.08,0-.161,0-.241,0c0,.162,0,.323,0,.485 c-.16,.081-.321,.162-.481,.243c-.08,.242-.161,.485-.241,.727c-.161,0-.321,0-.481,0 c-.081,.162-.161,.323-.241,.485c-.241,0-.481,0-.722,0c0,.081,0,.162,0,.243c-.948,.302-1.447-.326-1.927,0 c0.161,0,.321,0,.481,0c0.418,.483,.55,.204,.963,.485c0.161,.243,.321,.485,.482,.728c0.16,0,.321,0,.481,0 c0.321,.404,.643,.808,.963,1.212c0.161,0,.321,0,.481,0c0,.081,0,.162,0,.243c0.241,.081,.481,.162,.723,.242 c-.275,.276-.001,.097-.482,.243c-.344,.403-1.696,.803-2.649,.485c0-.081,0-.162,0-.243c-.241,0-.481,0-.722,0 c-.883-.646-1.766-1.293-2.649-1.939c-.08-.242-.161-.485-.241-.727c-.24-.162-.481-.323-.722-.485 c0,.162,0,.324,0,.485c1.451,1.244,.854,4.622,.722,6.789c-.08,0-.16,0-.24,0c-.562-.486-1.124-.971-1.686-1.456 c-.964-1.453-.676-3.629-.481-5.576c-.08,0-.161,0-.24,0c0,.162,0,.323,0,.485c-.081,0-.161,0-.241,0 c0,.162,0,.323,0,.485c-.081,0-.161,0-.241,0c0,.162,0,.323,0,.485c-.55,.802-3.166,2.527-5.057,1.94 c0-.081,0-.162,0-.243c-.562-.081-1.124-.162-1.686-.243c0-.081,0-.162,0-.242c0.161,0,.321,0,.482,0 c0-.081,0-.162,0-.243c0.241,0,.481,0,.722,0c0.08-.162,.161-.323,.241-.485c0.481-.404,.963-.808,1.444-1.212 c0.401-.485,.803-.97,1.204-1.455c0.6-.339,1.892-.026,2.408-.485c-2.851-.17-5.468-.854-5.539-3.879c0.08,0,.16,0,.241,0 c0.524,.918,1.28,1.164,2.649,1.212c0.401,0,.803,0,1.204,0c0,.081,0,.162,0,.243c0.241,0,.481,0,.722,0 c0.08,.162,.161,.323,.241,.485c0.161,0,.321,0,.482,0c0,.081,0,.162,0,.243c0.24,.162,.481,.323,.723,.485 c0,.162,0,.323,0,.485c0.08,0,.16,0,.24,0c0-.162,0-.323,0-.485c0.471-.433,.205-.463,.481-.97 c0.081,0,.161,0,.241,0c0-.162,0-.324,0-.485c0.08,0,.16,0,.241,0c0-.162,0-.323,0-.485c0.08,0,.161,0,.241,0 c0.081-.242,.161-.485,.241-.727c0.161-.081,.321-.162,.481-.243c0.461-.675,.283-.969,1.204-1.212 c0-.081,0-.162,0-.243C19.01,.503,19.25,.583,19.491,.665z M7.21,11.332c0,.081,.963,.566,1.445,.728 c0,.081,.802,.242,1.204,.242c1.722,.513,2.71-.309,4.334-.485c0.369,2.181,1.992,4.42,4.335,4.607 c0.401-.565,.802-1.132,1.204-1.697c0.161-1.131,.321-2.263,.481-3.395c0.081,0,.161,0,.241,0 c0.337,.399,2.566,1.117,3.612,.728c0-.081,0-.162,0-.243c0.481-.162,.963-.323,1.445-.485 c0.375-.849,.816-1.722,1.204-2.667c-1.575-.011-1.906-.681-3.13-.97c0-.162,0-.323,0-.485c0.241,0,1.605-.808,1.686-.97 c0.08,0,.241-.485,.241-.728c0.08,0,.161,0,.241,0c0,.081,0,.162,0,.243c0.401,.081,.802,.162,1.204,.242 c0,.081,.321,.243,.481,.243C27.518,6.402,28,6.726,28.16,6.726c0.401,.485,.803,.97,1.204,1.455 c0.16,.081,.321,.162,.481,.243c0,.162,.321,.646,.481,.727c0,.162,.161,.485,.241,.485 c0,.243,.16,.728,.241,.728c0,.162,.161,.485,.24,.485c0,.323,.81,4.637,.482,6.547 c-.063,.59-.241,1.131-.241,1.697c-.087,.628-.241,.646-.241,.97c-.096,.175-.24,.681-.24,.97 c-.081,0-.241,.485-.241,.727c-.08,0-.241,.485-.241,.728c-.08,0-.241,.323-.241,.485 c-.08,0-.401,.646-.481,.97c-.16,.081-.642,.889-.722,1.212c-.241,.162-.723,.808-.723,.97 c-.481,.404-.963,.808-1.445,1.212c-.161,.243-.321,.485-.481,.728c-.161,0-.803,.485-.963,.728 c-.161,0-.642,.323-.723,.485c-.321,.081-.963,.404-.963,.485c-.321,.081-.963,.404-.963,.485 c-.497,.131-.634,.169-.722,.242c-.071,0-.165,.139-.482,.243c-.941,.369-5.767,1.151-7.224,.728 c0-.081-.963-.243-1.444-.243c0-.081-.643-.242-.963-.242c0-.081-.301-.161-.723-.243 c0-.081-.481-.243-.723-.243c0-.081-.321-.242-.481-.242c0-.081-.321-.243-.481-.243 c0-.081-.321-.242-.481-.242c0-.081-.321-.243-.482-.243c0-.081-.321-.242-.481-.242 c-.08-.162-.562-.485-.723-.485c-.16-.243-.802-.728-.963-.728c-.482-.565-.963-1.131-1.445-1.697 c-.321-.242-.642-.485-.963-.727c0-.162-.481-.808-.722-.97c0-.162-.321-.646-.482-.728 c-.08-.323-.401-.97-.481-.97C2.073,22.647,1.752,22,1.672,22c-.161-.728-.643-2.182-.723-2.182 c0-.485-.16-1.455-.241-1.455c-.505-1.804,.496-6.934,.963-8.001c0.08,0,.401-.646,.481-.97 c0.081,0,.241-.323,.241-.485C2.555,8.827,2.876,8.342,2.876,8.18C3.036,8.1,3.197,8.019,3.357,7.938 c0.401-.485,.803-.97,1.204-1.455c0.321-.081,.643-.162,.963-.242c0.08-.162,.161-.323,.241-.485 c0.321-.081,.643-.162,.963-.243c0-.081,0-.162,0-.242c0.321,0,.642,0,.963,0c0-.081,0-.162,0-.243 c0.4-.153,.645-.116,.963-.242C8.802,6.381,9.378,5.908,10.1,6.726C9.699,7.21,9.297,7.695,8.896,8.18 c-.161,0-.321,0-.482,0c-.08,.162-.161,.323-.241,.485C7.451,8.908,6.809,11.009,7.21,11.332z"/></svg>
					</a>
					<h2 class="currentpage nav-collapse-hide"></h2>
				</div>

				<div class="left-container">
					<a href="#" class="toggle-nav"><i class="icon-align-left"></i></a>
				</div>

				<div class="pull-right links">
					<ul>
						<li><a href="#tools-ping.asp">Tools <i class="icon-tools"></i></a></li>
						<li><a href="#bwm-realtime.asp">Bandwidth <i class="icon-graphs"></i></a></li>
						<li><a href="#bwm-ipt-realtime.asp">IP Traffic <i class="icon-globe"></i></a></li>
						<li><a id="system-ui" href="#system">System <i class="icon-system"></i></a></li>
					</ul>
					<div class="system-ui">

						<div class="datasystem align center"></div>

						<div class="router-control">
							<a href="#" class="btn btn-primary" onclick="reboot();">Reboot <i class="icon-reboot"></i></a>
							<a href="#" class="btn btn-danger" onclick="shutdown();">Shutdown <i class="icon-power"></i></a>
							<a href="#" onclick="logout();" class="btn">Logout <i class="icon-logout"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="navigation">
				<ul>
					<li class="nav-footer" id="gui-version" style="cursor: pointer;" onclick="loadPage('#about.asp');"></li>
				</ul>
			</div>


			<div class="container">
				<div class="ajaxwrap"></div>
				<div class="clearfix"></div>
			</div>

		</div>
	</body>
</html>
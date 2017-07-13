{doc:}
<!DOCTYPE html>	
<html>
	<head>
		<link rel="stylesheet" href="/-collect/?css" />
	</head>
	<body>
		<div style="margin-top:50px" class="container">{/doc:}</div>
	</body>
</html>
{ROOT:}
	{:doc}
	<ul class="breadcrumb">
		<li><a href="/">Главная</a></li>
		<li class="active">Список прайсов</li>
	</ul>
	<h1>Сравнение прайсов и данных каталога</h1>
	Список прайсов
	<ul>
		{data::head}
	</ul>
	{:/doc}
{head:}
	<li><a href="/-prices/?price={~key}">{~key}</a><br>
		<i>Ошибки - прайс: <b>{~length(miss)}</b>, каталог: <b>{~length(lose)}</b>. Совпадения: <b>{~length(bingo)}</b></i>
	</li>
{PRICE:}
	{:doc}
	<ul class="breadcrumb">
		<li><a href="/-prices/">Список прайсов</a></li>
		<li class="active">Анализ {price}</li>
		<li><a href="/-prices/?price={price}&show">Проверка шапки</a></li>
	</ul>
	<h1>Прайс {price}</h1>
	{data:body}
	{:/doc}
	{body:}
		<i>Ошибки - прайс: <b>{~length(miss)}</b>, каталог: <b>{~length(lose)}</b>. Совпадения: <b>{~length(bingo)}</b></i>
		<div>Поиск в прайсе: <b>{rule.price}</b></div>
		<div>Поиск в каталоге: <b>{rule.catalog}</b></div>
		{:showpriceerror}
		{:showcaterror}

		{:showbingo}
		<h2>Картинки без совпадений</h2>
		Всего: {~length(images)}
		<table class="table table-striped">
			{images::images}
		</table>
		{images:}
			<tr><td>{~key}</td><td>{::image}</td></tr>		
		{image:}
			<img title="{.}" src="/-imager/?src={.}&h=50">
	{showpriceerror:}
		<h2>Ошибки прайса</h2>
		<i>Позиции в прайсе без совпадений с каталогом - <b>{~length(miss)}</b></i>
		<ul>
			{miss::list-miss}
		</ul>
		{list-miss:}
			<li>{price.pricekey}</li>
	{showcaterror:}
		<h2>Ошибки каталога</h2>
		<i>Найдены позиции только в каталоге - <b>{~length(lose)}</b></i>
		<table class="table table-striped">
			<tr><th>Каталог</th><th>Поиск в прайсе</th></tr>
			{lose::list-lose}
		</table>
		{list-lose:}
			<tr>
			<td>
				<a href="/catalog/{catalog.producer}/{catalog.article}">{catalog.Артикул}</a>
				{:info}
				<br>{catalog.images::image}
			</td>
			<td class="danger">{catalog.pricekey}</td></tr>
	{showbingo:}
		<h2>Совпадения</h2>
		<i>Найдны позиции и в прайсе, и в каталоге - <b>{~length(bingo)}</b></i>
		<table class="table table-striped">
			<tr><th>Каталог</th><th>Поиск в прайсе</th></tr>
			{bingo::list-bingo}
		</table>
		{list-bingo:}
			<tr>
				<td>
					<a href="/catalog/{catalog.producer}/{catalog.article}">{catalog.Артикул}</a>
					{:info}
					<br>{catalog.images::image}
				</td>
			<td class="success">{price.pricekey}</td></tr>
{SHOW:}
	{:doc}
	<ul class="breadcrumb">
		<li><a href="/-prices/">Список прайсов</a></li>
		<li><a href="/-prices/?price={price}">Анализ {price}</a></li>
		<li class="active">Проверка шапки</li>
	</ul>
	<h1>Шапка прайса {price}</h1>
	<div>Поиск в прайсе: <b>{rule.price}</b></div>
	<div>Поиск в каталоге: <b>{rule.catalog}</b></div>
	{data::exlist}
	{:/doc}
	{exlist:}
		<h2>{~key}</h2>
		{::exhead}.
		{exhead:}{.}{~last()|:comma}

{comma:}, 
{info:}
	<small style="color:gray; float:right">
		Цена: <b>{~cost(catalog.Цена)} руб.</b>, 
		Код: <b>{catalog.Код}</b>
	</small>
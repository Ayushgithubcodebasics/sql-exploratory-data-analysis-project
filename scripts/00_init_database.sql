Okay, so now what is exactly in magnitude analysis?

It's all about comparing the measure values across different categories and dimensions.

And this can help us of course to understand the importance of different categories.

Now the formula for that can be interesting.

So now this time we will be mixing stuff together.

So first we have to go and aggregate a specific measure.

And then we say by dimension we need here the dimension in order to split the measure.

It sounds complicated but it is very simple and basic.

So for example we can say the total sales by country, the total quantity by category, the average

price by products, the total orders by customer.

And if you follow this formula, you will be generating endless amount of insights.

By just combining any measure with any dimension you can call it.

It is a new insights.

So it can look like like this.

If you have one measure that is like for example 600.

And if you put now this measure together with dimension, what can happen?

This 600 is going to be splitted by the dimension values.

So A is going to have like 200 B going to have 300 and C 100.

And now with that we can go and compare those categories.

Right.

So we can see now that category B has the highest measure and the C has the lowest.

And this helps us to compare the values of the measure.

What is the best category and what is the worst category.

So this is very basic analysis.

So let's go and apply this formula on our data sets okay.

So now let's go and break all our measures by dimensions.

So here I have prepared a few interesting examples where first we're going to break the total number

of customers.

As we learned we have 18,000 by the countries.

So the measure is total customers and the dimension going to be the countries.

So let's go and write the query for that.

So we're going to select.

So the first thing that we're going to go and add is the dimension.

So it's going to be the country.

And then we need the measure.

It's going to be the count of the customer key.

So this will give us the total customers.

And we need to select our table.

So it's going to be the dimension customers.

And of course we have to go and group up the data by the countries.

So group up country.

So let's go and execute it.

And with that you see again the list of countries.

So we have our six countries and then the total customers for each country.

So with that we can see the distribution of customers by the country.

But what we usually do is that we go and sort the data by the measure, the total customers like this,

and we're going to sort it by descending.

So with that we will get first the countries with the highest customers.

So let's go and execute it.

So now we can see in the results the highest number of customers come from United States then Australia,

United Kingdom 337 customers without the country information it is not available.

So that's it right?

It is very simple.

So with that we have splitted the total number of customers by a dimension the country.

Now of course we can go and split the data by different type of dimension.

So for the next one we are saying find the total customers by gender.

So here's the same thing.

We have the same measure, the total customers.

But we are splitting the data by different type of dimension.

So just copy and paste.

And now instead of countries we're just going to switch it to gender.

And over here and that's it.

So let's go and execute.

So now as you can see the granularity of the gender over here is different than the countries we have

here.

Only three values.

And we can see it is almost splitted evenly between male customers and female customers.

And of course this can help us to understand the demography of our customers.

And as you can see, it was very simple.

We just switch the dimension so you can go and split as well by the maritalstatus and so on.

Now let's go and split that total products by the category.

Well actually the query is going to be very simple as well.

So select and here we're going to have the same aggregate function the count products key as total products

from our table dimension products.

And then we're going to group up by the dimension the category.

And we're we can order by as well the same thing.

Total products distinct from the highest to the lowest.

So let's go and execute it.

And with that we can see how many products do we have in each of those categories.

And we can see the biggest category the components.

And after that the pikes.

And this is interesting that we have seven products where we have nulls where they don't belong to any

category.

This is really nice.

Let's go to the next one.

What do we have over here.

What is the average costs in each category.

So this is like different style of question.

But at the end we can have the same thing we have over here.

The average costs.

This is the measure and the category is our dimension.

It's like we are saying find average costs by category.

So what we're going to do, we're going to go and copy the same query and the dimension is the same.

So the categories but the measure is different.

We are not talking about the total products.

We are going to say average.

And here we can have the column costs.

And let's go to rename it average costs.

So that's it as well.

For the order by you have to use the new measure.

So let's go and execute it.

So now we can see the most expensive category is the bikes costs a lot compared to the accessories of

course.

So you can see the accessories is only 13 and the bikes is 900.

So this is as well gives us insights about how expensive each category is.

And as you can see it is always the same.

Templates.

We are splitting a specific measure by a dimension, so let's keep going to the next one.

It says what is the total revenue generated for each category.

So again here the question is find the total revenue by category.

So the total revenue here is the measure.

And the category again is the dimension.

So now the total revenue comes from the fact.

And the category comes this time from the dimension.

So that means we have to go and join tables.

Right.

So how are we going to do it.

Let's go and start with the select star from.

And I would like always to start from the fact table.

So fact sales F.

And then we're going to go and join it with that dimension.

And usually I go with the left join in order to not lose anything because if you use an inner join,

you might lose in the fact few orders and few sales.

I don't want that.

So left join with the dimension.

This one going to be the products.

And the key for that is going to be very simple.

It's going to be the product key and the same thing for the facts.

So with that we joined the fact table with the dimension.

So now we have to go and pick.

What do we need.

We need from the fact the sales right.

So sales amount and we need from the products the category.

And we want to group up the data by the category.

So so this part is done.

What is missing is of course the aggregations.

So we are aggregating actually the sales.

So sum the sales and we can call it total revenue.

So like this.

And of course we can go and order the data by the total revenue by our measure and distinct from highest

to the lowest.

So as you can see it is exactly like the previous one.

But here the data doesn't come from only one table.

It comes from two tables.

So the measure come from the facts and the dimensions come from the dimension products.

And this is classic, right?

The dimension has all those descriptions and details about the products like the categories.

And the fact table has all those measures and dates that we use in order to calculate our measures.

So that's it.

Let's go and execute it.

Now.

As you can see in the output, the category bikes is bringing the most of revenue.

So here it's like in millions 28 millions of sales.

And the accessories and the clothing is not really bringing a lot of revenue.

Both of them are below like 1 million.

So with that we can understand our business is making a lot of money selling bikes, right.

So my friends, as we are exploring the data, we are understanding more and more about our business,

right?

So let's keep going to the next one.

We have here the question, what is the total revenue generated by each customer.

So now we want to find out the top spender right select star.

And as well we start from the fact table.

And this time we're going to lift join it with the that customers.

Right.

So the dimension customers and we're going to join the data.

So we're going to use the customer key for the join.

And what we're going to do.

We're going to go and get maybe the customer key.

And let's go and get as well the first name, maybe few details about the customer and as well the last

name.

So those are the columns that we want from the customers.

And now what do we need.

We need the aggregation.

So it's going to be the same thing sales amount as total revenue.

And we have to go and group up the data by all those three informations.

So we're going to go and copy paste.

And at the end as usual we're going to order by the measure total revenue descending.

So that's it.

It is exactly like the previous one but with different dimensions.

So let's go and query it.

And now we get a full list of all our customers the 18,000.

And we can see that the total revenue for each customer.

So we can see Nicole and Caitlin.

They are our top spenders and the most loyal customers that generated sales and revenue for our business.

This is really cool right now.

Let's go to the next one.

It says, what is the distribution of salt items across countries?

It is like finding the total quantity by countries.

So it is very simple.

I'm going to go and take the same query because countries comes from the dimension customers and the

salt items, the quantity come from the sales.

So we are doing the same joins but with different dimensions and measures.

So what do we need from the customers is only the country and the measure is going to be the quantity.

And here we can go and say total sold items.

And we have to change the group by to the countries and sorting the data by the new measure.

That's it.

And with that we are generating new reports by just changing the dimensions and measures.

So again this is very interesting to understand which country is generating like good business for us.

So my friends, as you might already noticed, if in the dimension we have like a small number of unique

values, like in the countries we have here only seven values and the gender we have only three.

We call those dimensions low cardinality dimensions because we have low number of values inside it,

and in the results we will get only here, for example, seven rows.

But if our dimension is high cardinality like by the customers, we have 18,000 unique customers.

Then our measure is going to be splitted by those 18,000.

And in the results we will get exactly the same number of customers.

So the number of rows and results really depends on the cardinality of the dimension.

So as you can see, we can generate a lot of different reports by only following this formula.

Dividing the measure by a dimension.

So we just generated eight different insights and reports by only few measures and dimensions.

So now what you can do.

You can pause the video and try different dimensions and measures in order to have more insights about

our business.

Okay.

So as you can see this is the basic analysis that we can do in any data set or any domain where we are

aggregating a measure by dimension.

Now in the next and last step in our projects we will be doing ranking analysis.
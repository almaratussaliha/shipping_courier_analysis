
--- change data type
alter table courier 
alter column delay_or_ontime type integer using (delay_or_ontime::integer)

alter table courier 
alter column delay_or_ontime type varchar using (delay_or_ontime::varchar) 

-- join tables 
select *from courier c 
left join mapping_province mp 
on c.province_code = mp.province_code 

select c.expedition , c.mode_of_shipment , c.customer_care_calls , c.customer_rating , 
		c.prior_purchases , c.product_importance , mp.province , c.weight_in_gms , 
		c.cost_of_the_product , c.discount_offered, c.cost_of_the_product - c.discount_offered  as cost_after_disc, 
		c.delay_or_ontime 
from courier c 
left join mapping_province mp 
on c.province_code = mp.province_code 


-- check outliers
with percentile as (
	select percentile_cont(0.25) within group (order by c.discount_offered) as percentile_25,
	percentile_cont(0.75) within group (order by c.discount_offered) as percentile_75
	from courier c 
),
iqr as (
	select percentile_25, percentile_75, (percentile_75 - percentile_25) as iqr_per
	from percentile
),
discount as (
	select id, discount_offered from courier c2 
	group by id , discount_offered 
)

select 
	case when discount_offered >= percentile_75 + iqr_per * 1.5  then 'positive outlier'
	when discount_offered <= percentile_25 - iqr_per * 1.5 then 'negative outlier'
	else 'inlier' end as status_outlier,
	count(discount_offered)
from discount, iqr
group by 
	case when discount_offered >= percentile_75 + iqr_per * 1.5  then 'positive outlier'
	when discount_offered <= percentile_25 - iqr_per * 1.5 then 'negative outlier'
	else 'inlier' end 
	
-- check outlier per row	
select id, discount_offered, 
	case when discount_offered >= percentile_75 + iqr_per * 1.5  then 'positive outlier'
	when discount_offered <= percentile_25 - iqr_per * 1.5 then 'negative outlier'
	else 'inlier' end as status_outlier
from discount, iqr 


--- change data dimension 
select c.expedition , c.mode_of_shipment , c.customer_care_calls , c.customer_rating , c.prior_purchases , 
		c.product_importance , c.gender , mp.province , c.weight_in_gms , c.delay_or_ontime , c.cost_of_the_product , 
		c.discount_offered , cost_of_the_product - discount_offered as cost_after_discount
from courier c 
left join mapping_province mp 
on c.province_code = mp.province_code 


select c.id, c.expedition , c.mode_of_shipment , 'customer rating' as indicator,
		c.product_importance , c.gender , c.province_code , mp.province , c.customer_rating 
from courier c 
left join mapping_province mp on c.province_code = mp.province_code 

union all

select c.id, c.expedition , c.mode_of_shipment , 'cost of the product' as indicator,
		c.product_importance , c.gender , c.province_code , mp.province , c.cost_of_the_product  
from courier c 
left join mapping_province mp on c.province_code = mp.province_code 

union all 

select c.id, c.expedition , c.mode_of_shipment , 'customer care calls' as indicator,
		c.product_importance , c.gender , c.province_code , mp.province , c.customer_care_calls  
from courier c 
left join mapping_province mp on c.province_code = mp.province_code 

union all

select c.id, c.expedition , c.mode_of_shipment , 'delay or not' as indicator,
		c.product_importance , c.gender , c.province_code , mp.province , c.delay_or_ontime  
from courier c 
left join mapping_province mp on c.province_code = mp.province_code 

union all

select c.id, c.expedition , c.mode_of_shipment , 'discon offered' as indicator,
		c.product_importance , c.gender , c.province_code , mp.province , c.discount_offered  
from courier c 
left join mapping_province mp on c.province_code = mp.province_code 

union all 

select c.id, c.expedition , c.mode_of_shipment , 'prior purchase' as indicator,
		c.product_importance , c.gender , c.province_code , mp.province , c.prior_purchases  
from courier c 
left join mapping_province mp on c.province_code = mp.province_code 

union all 

select c.id, c.expedition , c.mode_of_shipment , 'weight in gr' as indicator,
		c.product_importance , c.gender , c.province_code , mp.province , c.weight_in_gms  
from courier c 
left join mapping_province mp on c.province_code = mp.province_code 


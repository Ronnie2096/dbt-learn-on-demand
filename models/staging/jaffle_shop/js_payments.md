{% docs payment_status %}
	
One of the following values: 

| status         | definition                                       |
|----------------|--------------------------------------------------|
| success        | Payment was successful                           |
| fail           | Payment failed due to some kind of error         |

{% enddocs %}

{% docs payment_method %}
	
One of the following values: 

| paymentmethod  | definition                                       |
|----------------|--------------------------------------------------|
| coupon         | Paid with a coupon                               |
| credit_card    | Paid via credit card                             |
| bank_transfer  | Paid via bank transfer                           |
| gift_card      | Paid with a legit gift card                      |

{% enddocs %}
import math
from functools import reduce


# order list from the instruction
orders = [
    [34587, "Learning Python, Mark Lutz", 4, 40.95],
    [98762, "Programming Python, Mark Lutz", 5, 56.80],
    [77226, "Head First Python, Paul Barry", 3, 32.95],
    [88112, "Automate the Boring Stuff, Al Sweigart", 2, 24.99],
    [43901, "Python Crash Course, Eric Matthes", 6, 38.50],
    [55233, "Fluent Python, Luciano Ramalho", 1, 64.99],
    [66544, "Effective Python, Brett Slatkin", 3, 45.00],
    [77855, "Python Tricks, Dan Bader", 4, 29.95],
    [88966, "Think Python, Allen Downey", 2, 27.95],
    [99012, "Python for Data Analysis, Wes McKinney", 5, 49.99],
    [10123, "Data Science from Scratch, Joel Grus", 3, 44.95],
    [11234, "Python Programming for Beginners, John Zelle", 2, 22.50],
    [12345, "Black Hat Python, Justin Seitz", 1, 39.99],
    [13456, "Mastering Python, Rick van Hattem", 4, 35.95],
    [14567, "Python Cookbook, David Beazley", 2, 54.00]]

def compute_grand_total(orders):

    def create_tax_rate_calculator(tax_rate):
        def calculate_subtotal_with_tax(subtotal):
            return subtotal * (1 + tax_rate)
        return calculate_subtotal_with_tax
    
    def create_quantity_based_discount_applier(discount_rate, threshold):
        def apply_discount_if_quantity_exceeds_threshold(quantity, subtotal):
            if quantity > threshold:
                return subtotal * (1 - discount_rate)
            return subtotal
        return apply_discount_if_quantity_exceeds_threshold
    
    
    # rates defined from instruction page
    tax_rate = 0.065  
    discount_rate = 0.10  
    discount_threshold = 5  
    
    apply_tax = create_tax_rate_calculator(tax_rate)
    apply_discount = create_quantity_based_discount_applier(discount_rate, discount_threshold)
    


    def calculate_individual_order_total(order):
        order_id, title, quantity, unit_price = order
        subtotal = quantity * unit_price
        discounted_total = apply_discount(quantity, subtotal)
        final_total = apply_tax(discounted_total)
        
        return final_total
    
    order_totals = map(calculate_individual_order_total, orders)
    grand_total = reduce(lambda acc, total: acc + total, order_totals, 0)
    
    return grand_total


grand_total = compute_grand_total(orders)
print(f"grand total for all orders: ${grand_total:.2f}")

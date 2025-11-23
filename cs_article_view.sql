/*
# You are required to complete this fucntion
# Function should return the an integer
class Solution:
    def findMaxProduct(self, arr, k):
        mod = 10**9 + 7
        n = len(arr)
        
        # Calculate the product of the first window of size k
        prod = 1
        for i in range(k):
            prod *= arr[i]
        max_prod = prod
        
        # Slide the window from index k to end
        for i in range(k, n):
            # To avoid division by zero, handle zeros carefully
            if arr[i - k] != 0:
                prod = prod // arr[i - k] * arr[i]
            else:
                # Recalculate product from scratch if zero was in previous window
                prod = 1
                for j in range(i - k + 1, i + 1):
                    prod *= arr[j]
            
            if prod > max_prod:
                max_prod = prod
                
        return max_prod % mod
*/
-- Solution :
select author_id, author_name, publication_name from Views
where view_count = 0 order by author_id asc;
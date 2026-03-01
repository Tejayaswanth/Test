// Check if we are missing health
if (my_health < max_health)
{
    // Heal 1 chunk of health!
    my_health += 1;
    
    // Destroy the fruit so you can't eat it twice!
    instance_destroy(other);
}
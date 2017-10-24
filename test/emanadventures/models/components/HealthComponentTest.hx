package emanadventures.models.components;

using haxesharp.exceptions.ArgumentException;
using haxesharp.test.Assert;

class HealthComponentTest
{
    @Test
    public function constructorThrowsIfHesalthIsNonNegative()
    {
        Assert.throws(ArgumentException, function() { new HealthComponent(-1); });
        Assert.throws(ArgumentException, function() { new HealthComponent(0); });
    }

    @Test
    public function currentAndTotalHealthUseConstructorValue()
    {
        var h = new HealthComponent(100);
        Assert.that(h.currentHealth, Is.equalTo(100));
        Assert.that(h.totalHealth, Is.equalTo(h.currentHealth));
    }

    @Test
    public function getHurtDecreasesCurrentHealth()
    {
        var h = new HealthComponent(10);
        h.getHurt(4);
        Assert.that(h.currentHealth, Is.equalTo(10 - 4));
    }

    @Test
    public function isAliveIsTrueWhenHealthIsGreaterThanZero()
    {
        var h = new HealthComponent(10);
        h.getHurt(4);
        Assert.that(h.isAlive());

        h.getHurt(8);
        Assert.that(h.isAlive(), Is.equalTo(false));                
    }
}
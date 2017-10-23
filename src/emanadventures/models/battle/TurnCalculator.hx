package emanadventures.models.battle;

import haxesharp.collections.Dictionary;
using haxesharp.collections.Linq;
using haxesharp.exceptions.ArgumentException;

class TurnCalculator
{
    private var entityMovePoints:Dictionary<IBattleEntity, Int>;
    private var totalPointsNeeded = 1;

    // Assumptions: list of entities doesn't change mid-battle
    // if it does, create an "addEntity" method and recalculate
    // the total points values, or something.
    public function new(entities:Array<IBattleEntity>)
    {
        if (entities == null || !entities.any())
        {
            throw new ArgumentException("Please pass in a non-empty list of entities.");
        }

        this.totalPointsNeeded = 1;
        this.entityMovePoints = new Dictionary<IBattleEntity, Int>();

        // TODO: implement a real LCM algorithm. This path leads to integer overflow.
        for (entity in entities)
        {
            // Initialize dictionary
            this.entityMovePoints[entity] = 0;

            // If e.agility is not evenly divisible, multiply it in. This way, if we
            // have (say) three slimes with agility 5, instead of 5*5*5 we use 5.
            if (totalPointsNeeded % entity.agility != 0)
            {
                totalPointsNeeded *= entity.agility;
            }
        }
    }

    /**
    STATEFUL. Updates the number of "move points" each entity has.
    Calling this repeatedly moves time forward, so to speak.
    */
    public function calculateNextTurn():IBattleEntity
    {
        var hasTurns = this.getEntitiesWithTurns();
        var maxAgility = this.getMaxEntityAgility();

        if (!hasTurns.any())
        {
            // Find the minimum number of points before someone's turn
            var pointsToNextTurn = totalPointsNeeded;

            for (entity in entityMovePoints.keys())
            {
                var currentPoints:Int = this.entityMovePoints[entity];
                var pointsNeeded = totalPointsNeeded - currentPoints;
                pointsToNextTurn = Std.int(Math.min(pointsToNextTurn, pointsNeeded));
            }
        
            // Now we know the amount needed, so increment points.
            for (entity in entityMovePoints.keys())
            {
                this.entityMovePoints[entity] += pointsToNextTurn;
            }

            hasTurns = this.getEntitiesWithTurns();
        }
        
        // Choose randomly from the fastest person with a turn
        return hasTurns.where((b) => b.agility == maxAgility).shuffle().first();
    }

    private function getEntitiesWithTurns():Array<IBattleEntity>
    {
        var hasTurn:Array<IBattleEntity> = [];

        // Increment everyone's points
        for (entity in entityMovePoints.keys())
        {
            if (this.entityMovePoints[entity] >= this.totalPointsNeeded)
            {
                hasTurn.push(entity);
            }
        }

        return hasTurn;
    }

    private function getMaxEntityAgility():Int
    {
        var toReturn:Int = this.entityMovePoints.keys().first().agility;

        for (entity in this.entityMovePoints.keys())
        {
            toReturn = Std.int(Math.max(toReturn, entity.agility));
        }

        return toReturn;
    }
}
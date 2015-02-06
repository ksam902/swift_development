import UIKit

class DrawExamples: UIView {


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func drawRect(rect: CGRect) {
        // -- Context is used for drawing
        let context = UIGraphicsGetCurrentContext()
        
        // -- Making Use of Images from the Supper Files Directory
        
        /*
        let logo = UIImage(named: "profile3.png")
        //give coordinates location for the placement of the logo image
        let location = CGPointMake(25, 25)
        logo?.drawAtPoint(location)
        */
        
        // -- Fill the Screen
        // get the dimensions of the users screen so the image will be dynamically sized
        let logo = UIImage(named: "profile3.png")
        let entireScreen = UIScreen.mainScreen().bounds
        logo?.drawInRect(entireScreen)
        
        
        /*
        // -- Fill in a Custom Shape with a Specified Color
        CGContextMoveToPoint(context, 50, 50)
        CGContextAddLineToPoint(context, 90, 130)
        CGContextAddLineToPoint(context, 180, 100)
        CGContextAddLineToPoint(context, 90, 60)
        CGContextAddLineToPoint(context, 50, 50)
        // -- Fill with color
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextFillPath(context)
        */
        
        /*
        //above 7.0 for width is TOO THICK for most cases - Try to keep this below that number
        CGContextSetLineWidth(context, 3.0)
        CGContextSetStrokeColorWithColor(context, UIColor.purpleColor().CGColor)
        */
        
        /* 
        //---------- Drawing a Straight Line ---------
        // -- Create Path - Starting Point
        CGContextMoveToPoint(context, 30, 30)
        // -- Drawing a diagonal line
        CGContextAddLineToPoint(context, 150, 320)
        */
        
        /*
        //---------- Drawing a Custom Shape ---------
        CGContextMoveToPoint(context, 50, 50)
        CGContextAddLineToPoint(context, 90, 130)
        CGContextAddLineToPoint(context, 180, 100)
        CGContextAddLineToPoint(context, 90, 60)
        CGContextAddLineToPoint(context, 50, 50)
        */
        
        /*
        //---------- Drawing a Rectangle Shape ---------
        let rectangle = CGRectMake(50, 50, 200, 400)
        CGContextAddRect(context, rectangle)
        */
        
        // -- Actually draw the path
        CGContextStrokePath(context)
        
    }


}

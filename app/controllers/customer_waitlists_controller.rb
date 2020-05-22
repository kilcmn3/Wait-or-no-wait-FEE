class CustomerWaitlistsController < ApplicationController
    def update
        customer_waitlist = CustomerWaitlist.find(params[:id])
        wait_List =  Waitlist.find_by(waitlist_date: Date.today.to_s)

        if  params[:customer_waitlist][:estimate_waitTime] != nil
            if  params[:customer_waitlist][:estimate_waitTime] < 0
            customer_waitlist.update(estimate_waitTime: 0)
            end
            customer_waitlist.update(paramse_update)
        elsif params[:customer_waitlist][:is_texted]
            # CustomerWaitlist.send_SMS
            customer_waitlist.update(paramse_update)
        else
            customer_waitlist.update(paramse_update)
        end
         render json: wait_List, include: "customers.customerWaitlists"
end
    
    private
    
    def  paramse_update
        params.require(:customer_waitlist).permit(:is_waiting, :estimate_waitTime, :is_texted)
    end
end

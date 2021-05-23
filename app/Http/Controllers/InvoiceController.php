<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Invoice;
use App\Models\Session;
use App\Models\User;
use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function createInvoice(Request $request)
    {
        $invoice = new Invoice();
        $customerId = $request->customerId;
        $this->startDate = $request->startDate; // invoice start date
        $this->endDate = $request->endDate; // invoice end date

        // Check if the provided customer Id exists
        if (Customer::where('id', '=', $customerId)->exists()) {
            $userIds = User::select('id')
                ->where('customer_id', $customerId)
                ->get()
                ->toArray();
            $invoiceData = json_encode($this->getUserData($userIds));
        }

        $invoice->customer_id = $customerId;
        $invoice->start_date = $this->startDate;
        $invoice->end_date = $this->endDate;
        $invoice->invoice_data = $invoiceData;

        $invoice->save();
        return response()->json(
            [
                'message' => 'Invoice Generated. Invoice ID: ' . $invoice->id,
            ],
            201
        );
    }

    public function getInvoice($id)
    {
        if(Invoice::where('id', $id)->exists()) {

            $customerInvoice = Invoice::select('invoice_data')
                ->where('id', $id)
                ->get()->toArray();

            return  json_decode($customerInvoice[0]['invoice_data'], true);
          } else {
            return response()->json([
              "message" => "Invoice record not found"
            ], 404);
          }
  
    }

    public function getUserData($userIds)
    {
        $invoiceArray = [];

        foreach ($userIds as $user) {
            $userRegistration = User::select('created')
                ->where('id', $user['id'])
                ->get()
                ->toArray();

            $userActivated = Session::select('activated')
                ->where('user_id', $user['id'])
                ->get()
                ->toArray();

            $userAppointment = Session::select('appointment')
                ->where('user_id', $user['id'])
                ->get()
                ->toArray();

            $registration = array_column($userRegistration, 'created');
            $activation = array_filter(
                array_column($userActivated, 'activated')
            );
            $appointment = array_filter(
                array_column($userAppointment, 'appointment')
            );

            $invoiceTotal = $this->getInvoiceTotal(
                $registration,
                $activation,
                $appointment,
                $this->startDate,
                $this->endDate
            );

            $invoiceArray[$user['id']] = [
                'Registration' => $registration,
                'Activation' => $activation,
                'Appointment' => $appointment,
                'Invoice total' => $invoiceTotal,
            ];
        }

        return $invoiceArray;
    }

    public function getInvoiceTotal(
        $userRegistration,
        $userActivated,
        $userAppointment,
        $startDate,
        $endDate
    ) {
        $regDateRange = $this->dateInRange(
            $userRegistration,
            $startDate,
            $endDate
        );
        // return $regDateRange;
        $regPayment = 0.49;
        $activationPayment = 0.99;
        $appointmentPayment = 3.99;

        if (!empty($regDateRange)) {
            switch ($regDateRange) {
                case !empty($userActivated) && empty($userAppointment):
                    return $activationPayment;
                case empty($userActivated) && !empty($userAppointment):
                    return $appointmentPayment;
                case !empty($userActivated) && !empty($userAppointment):
                    return $appointmentPayment;
                default:
                    return $regPayment;
            }
        } else {
            if (!empty($userActivated) && empty($userAppointment)) {
                $activatedDateRange = $this->dateInRange(
                    $userActivated,
                    $startDate,
                    $endDate
                );

                return $activatedDateRange
                    ? $activationPayment - $regPayment
                    : 0;
            }

            if (empty($userActivated) && !empty($userAppointment)) {
                $activatedDateRange = $this->dateInRange(
                    $userAppointment,
                    $startDate,
                    $endDate
                );
                return $activatedDateRange
                    ? $appointmentPayment - $regPayment
                    : 0;
            }

            if (!empty($userActivated) && !empty($userAppointment)) {
                $activatedDateRange = $this->dateInRange(
                    $userAppointment,
                    $startDate,
                    $endDate
                );
                return $activatedDateRange
                    ? $appointmentPayment - $regPayment
                    : 0;
            } else {
                return 0;
            }
        }
    }

    public function dateInRange($dateArr, $startDate, $endDate)
    {
        $start = strtotime($startDate);
        $end = strtotime($endDate);

        $inDateRange = count(
            array_filter($dateArr, function ($value) use ($start, $end) {
                $value = strtotime($value);
                return $value >= $start && $value <= $end;
            })
        );

        return $inDateRange;
    }
}

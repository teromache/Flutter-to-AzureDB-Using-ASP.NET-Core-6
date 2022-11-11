using AutoMapper;
using fixit.DTO;
using fixit.Models;

namespace fixit.Profiles
{
    public class CustomerProfile : Profile
    {
        public CustomerProfile()
        {
            CreateMap<fixit.Models.Customer, CustomerDto>()
            .ForMember(dest => dest.CustomerId, opt => opt.MapFrom(src => src.CustomerId))
            .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.Email))
            .ForMember(dest => dest.PlateNumber, opt => opt.MapFrom(src => src.PlateNumber))
            .ForMember(dest => dest.PhoneNum, opt => opt.MapFrom(src => src.PhoneNum));
            // .ForMember(dest => dest.Category, opt => opt.MapFrom(src => src.Category))
            // .ForMember(dest => dest.InitialPrice, opt => opt.MapFrom(src => src.InitialPrice))
            // .ForMember(dest => dest.IntermediatePrice, opt => opt.MapFrom(src => src.IntermediatePrice))
            // .ForMember(dest => dest.AdvancedPrice, opt => opt.MapFrom(src => src.AdvancedPrice));
            // .ForMember(dest => dest.AddedTime, opt => opt.MapFrom(src => src.AddedTime));
           CreateMap<CustomerDto, fixit.Models.Customer>();

    
    
    
 }

    }
}